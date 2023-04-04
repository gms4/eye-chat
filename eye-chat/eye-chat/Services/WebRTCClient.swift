//
//  WebRTCClient.swift
//  eye-chat
//
//  Created by alexdamascena on 02/04/23.
//

import Foundation
import WebRTC

protocol WebRTCClientDelegate: AnyObject {
    func webRTCClient(_ client: WebRTCClient, didDiscoverLocalCandidate candidate: RTCIceCandidate)
    func webRTCClient(_ client: WebRTCClient, didChangeConnectionState state: RTCIceConnectionState)
    func webRTCClient(_ client: WebRTCClient, didReceiveData data: Data)
}

final class WebRTCClient: NSObject, ObservableObject {
    
    private static let factory: RTCPeerConnectionFactory = {
        RTCInitializeSSL()
        let videoEncoderFactory = RTCDefaultVideoEncoderFactory()
        let videoDecoderFactory = RTCDefaultVideoDecoderFactory()
        return RTCPeerConnectionFactory(encoderFactory: videoEncoderFactory, decoderFactory: videoDecoderFactory)
    }()
    
    weak var delegate: WebRTCClientDelegate?
    
    private let peerConnection: RTCPeerConnection
    private let audioQueue = DispatchQueue(label: "audio")
    private let rtcAudioSession = RTCAudioSession.sharedInstance()
    private let mediaConstrains = [
        kRTCMediaConstraintsOfferToReceiveAudio: kRTCMediaConstraintsValueTrue,
        kRTCMediaConstraintsOfferToReceiveVideo: kRTCMediaConstraintsValueTrue
    ]
    
    private var videoCapturer: RTCVideoCapturer?
    private var localVideoTrack: RTCVideoTrack?
    private var remoteVideoTrack: RTCVideoTrack?
    private var localDataChannel: RTCDataChannel?
    private var remoteDataChannel: RTCDataChannel?
    
    @available(*, unavailable)
    override init(){
        fatalError("web rtc client unavailable")
    }
    
    required init(iceServers: [String]){
        let configuration = RTCConfiguration()
        configuration.iceServers = [RTCIceServer(urlStrings: iceServers)]
        
        configuration.sdpSemantics = .unifiedPlan
        configuration.continualGatheringPolicy = .gatherContinually
        
        let constraints = RTCMediaConstraints(mandatoryConstraints: nil,
                                              optionalConstraints: ["DtlsSrtpKeyAgreement":kRTCMediaConstraintsValueTrue])
        
        guard let peerConnection = WebRTCClient.factory.peerConnection(with: configuration,
                                                                       constraints: constraints,
                                                                       delegate: nil) else {
            fatalError("Não rolou a conexão peer connection")
        }
        
        self.peerConnection = peerConnection
        super.init()
        createSenders()
        configureAudioSession()
        self.peerConnection.delegate = self
        
    }
    
    func offer(completion: @escaping (_ sdp: RTCSessionDescription) -> Void){
        let constraints = RTCMediaConstraints(mandatoryConstraints: mediaConstrains,
                                             optionalConstraints: nil)
        
        peerConnection.offer(for: constraints){ [weak self] (sdp, error) in
            guard let sdp = sdp else { return }
            
            self?.peerConnection.setLocalDescription(sdp, completionHandler: { (error) in
                completion(sdp)
            })
        }
    }
    
    func answer(completion: @escaping (_ sdp: RTCSessionDescription) -> Void){
        let constraints = RTCMediaConstraints(mandatoryConstraints: mediaConstrains,
                                              optionalConstraints: nil)
        self.peerConnection.answer(for: constraints){ [weak self] (sdp, error) in
            guard let sdp = sdp else { return }
            
            self?.peerConnection.setLocalDescription(sdp,
                                                     completionHandler: { (error) in
                completion(sdp)
            })
        }
    }
    
    func set(remoteSdp: RTCSessionDescription, completion: @escaping (Error?) -> ()){
        peerConnection.setRemoteDescription(remoteSdp,
                                            completionHandler: completion)
    }
    
    func set(remoteCandidate: RTCIceCandidate, completion: @escaping (Error?) -> ()){
        peerConnection.add(remoteCandidate, completionHandler: completion)
    }
    
    func startCaptureLocalVideo(renderer: RTCVideoRenderer){
        
        guard let capturer = videoCapturer as? RTCCameraVideoCapturer else { return }
        guard let frontCamera = (RTCCameraVideoCapturer.captureDevices().first { $0.position == .front }),
              let format = (RTCCameraVideoCapturer.supportedFormats(for: frontCamera).sorted { (f1, f2) -> Bool in
                  let width1 = CMVideoFormatDescriptionGetDimensions(f1.formatDescription).width
                  let width2 = CMVideoFormatDescriptionGetDimensions(f2.formatDescription).width
                  return width1 < width2
              }).last,
              let fps = (format.videoSupportedFrameRateRanges.sorted { return $0.maxFrameRate < $1.maxFrameRate }.last) else { return }
        
        capturer.startCapture(with: frontCamera,
                              format: format,
                              fps: Int(fps.maxFrameRate))
        
        localVideoTrack?.add(renderer)
    }
    
    func renderRemoteVideo(to renderer: RTCVideoRenderer){
        remoteVideoTrack?.add(renderer)
    }
    
    private func configureAudioSession(){
        rtcAudioSession.lockForConfiguration()
        do {
            try self.rtcAudioSession.setCategory(AVAudioSession.Category.playAndRecord.rawValue)
            try self.rtcAudioSession.setMode(AVAudioSession.Mode.voiceChat.rawValue)
        } catch let error {
            print("deu ruim \(error)")
        }
        
        self.rtcAudioSession.unlockForConfiguration()
    }
    
    private func createSenders(){
        let streamId = "stream"
        
        let audioTrack = createAudioTrack()
        peerConnection.add(audioTrack, streamIds: [streamId])
        
        let videoTrack = createVideoTrack()
        localVideoTrack = videoTrack
        peerConnection.add(videoTrack, streamIds: [streamId])
        remoteVideoTrack = peerConnection.transceivers.first{ $0.mediaType == .video}?
            .receiver.track as? RTCVideoTrack
        
        if let dataChannel = createDataChannel() {
            dataChannel.delegate = self
            localDataChannel = dataChannel
        }
    }
    
    private func createAudioTrack() -> RTCAudioTrack {
        let audioConstraints = RTCMediaConstraints(mandatoryConstraints: nil,
                                                   optionalConstraints: nil)
        let audioSource = WebRTCClient.factory.audioSource(with: audioConstraints)
        let audioTrack = WebRTCClient.factory.audioTrack(with: audioSource,
                                                         trackId: "audio0")
        return audioTrack
    }
    
    private func createVideoTrack() -> RTCVideoTrack {
        let videoSource = WebRTCClient.factory.videoSource()
        
        #if targetEnvironment(simulator)
        videoCapturer = RTCFileVideoCapturer(delegate: videoSource)
        #else
        videoCapturer = RTCCameraVideoCapturer(delegate: videoSource)
        #endif
        
        let videoTrack = WebRTCClient.factory.videoTrack(with: videoSource, trackId: "video0")
        return videoTrack
    }
    
    private func createDataChannel() -> RTCDataChannel? {
        let configuration = RTCDataChannelConfiguration()
        guard let dataChannel = peerConnection.dataChannel(forLabel: "WebRTCData", configuration: configuration) else {
            print("deu ruim")
            return nil
        }

        return dataChannel
    }
    
    func sendData(_ data: Data){
        let buffer = RTCDataBuffer(data: data,
                                   isBinary: true)
        remoteDataChannel?.sendData(buffer)
    }
}


extension WebRTCClient: RTCPeerConnectionDelegate {
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didChange stateChanged: RTCSignalingState) {
        debugPrint("peerConnection new signaling state: \(stateChanged)")
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didAdd stream: RTCMediaStream) {
        debugPrint("peerConnection did add stream")
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didRemove stream: RTCMediaStream) {
        debugPrint("peerConnection did remove stream")
    }
    
    func peerConnectionShouldNegotiate(_ peerConnection: RTCPeerConnection) {
        debugPrint("peerConnection should negotiate")
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceConnectionState) {
        debugPrint("peerConnection new connection state: \(newState)")
        self.delegate?.webRTCClient(self, didChangeConnectionState: newState)
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceGatheringState) {
        debugPrint("peerConnection new gathering state: \(newState)")
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didGenerate candidate: RTCIceCandidate) {
        self.delegate?.webRTCClient(self, didDiscoverLocalCandidate: candidate)
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didRemove candidates: [RTCIceCandidate]) {
        debugPrint("peerConnection did remove candidate(s)")
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didOpen dataChannel: RTCDataChannel) {
        debugPrint("peerConnection did open data channel")
        self.remoteDataChannel = dataChannel
    }
}

extension WebRTCClient: RTCDataChannelDelegate {
    func dataChannelDidChangeState(_ dataChannel: RTCDataChannel) {
        debugPrint("dataChannel did change state: \(dataChannel.readyState)")
    }
    
    func dataChannel(_ dataChannel: RTCDataChannel, didReceiveMessageWith buffer: RTCDataBuffer) {
        self.delegate?.webRTCClient(self, didReceiveData: buffer.data)
    }
}

extension WebRTCClient {
    
    private func setTrackEnabled<T: RTCMediaStreamTrack>(_ type: T.Type, isEnabled: Bool) {
        peerConnection.transceivers
            .compactMap { return $0.sender.track as? T }
            .forEach { $0.isEnabled = isEnabled }
    }
}

extension WebRTCClient {
    func hideVideo() {
        self.setVideoEnabled(false)
    }
    func showVideo() {
        self.setVideoEnabled(true)
    }
    private func setVideoEnabled(_ isEnabled: Bool) {
        setTrackEnabled(RTCVideoTrack.self, isEnabled: isEnabled)
    }
}


extension WebRTCClient {
    func muteAudio() {
        self.setAudioEnabled(false)
    }
    
    func unmuteAudio() {
        self.setAudioEnabled(true)
    }
    
    func speakerOff() {
        self.audioQueue.async { [weak self] in
            guard let self = self else {
                return
            }
            
            self.rtcAudioSession.lockForConfiguration()
            do {
                try self.rtcAudioSession.setCategory(AVAudioSession.Category.playAndRecord.rawValue)
                try self.rtcAudioSession.overrideOutputAudioPort(.none)
            } catch let error {
                debugPrint("Error setting AVAudioSession category: \(error)")
            }
            self.rtcAudioSession.unlockForConfiguration()
        }
    }
    
    // Force speaker
    func speakerOn() {
        self.audioQueue.async { [weak self] in
            guard let self = self else {
                return
            }
            
            self.rtcAudioSession.lockForConfiguration()
            do {
                try self.rtcAudioSession.setCategory(AVAudioSession.Category.playAndRecord.rawValue)
                try self.rtcAudioSession.overrideOutputAudioPort(.speaker)
                try self.rtcAudioSession.setActive(true)
            } catch let error {
                debugPrint("Couldn't force audio to speaker: \(error)")
            }
            self.rtcAudioSession.unlockForConfiguration()
        }
    }
    
    private func setAudioEnabled(_ isEnabled: Bool) {
        setTrackEnabled(RTCAudioTrack.self, isEnabled: isEnabled)
    }
}
