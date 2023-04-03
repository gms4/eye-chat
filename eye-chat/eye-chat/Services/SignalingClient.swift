//
//  SignalingClient.swift
//  eye-chat
//
//  Created by alexdamascena on 02/04/23.
//

import Foundation
import WebRTC

protocol SignalClientDelegate: AnyObject {
    func signalClientDidConnect(_ signalClient: SignalingClient)
    func signalClientDidDisconnect(_ signalClient: SignalingClient)
    func signalClient(_ signalClient: SignalingClient, didReceiveRemoteSdp sdp: RTCSessionDescription)
    func signalClient(_ signalClient: SignalingClient, didReceiveCandidate candidate: RTCIceCandidate)
}

final class SignalingClient {
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    private let webSocket: WebSocketProvider
    weak var delegate: SignalClientDelegate?
    
    init(webSocket: WebSocketProvider) {
        self.webSocket = webSocket
    }
    
    func connect(){
        webSocket.delegate = self
        webSocket.connect()
    }
    
    func send(sdp rtcSdp: RTCSessionDescription){
        let message = Message.sdp(SessionDescription(from: rtcSdp))
        do {
            let dataMessage = try encoder.encode(message)
            webSocket.send(data: dataMessage)
        } catch {
            print("deu ruim")
        }
    }
}


extension SignalingClient: WebSocketProviderDelegate {
    
    
    func webSocketDidConnect(_ webSocket: WebSocketProvider) {
        self.delegate?.signalClientDidConnect(self)
    }
    
    func webSocketDidDisconnect(_ webSocket: WebSocketProvider) {
        self.delegate?.signalClientDidDisconnect(self)
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5){
            webSocket.connect()
        }
    }
    
    func webSocket(_ webSocket: WebSocketProvider, didReceiveData data: Data) {
        let message: Message
        do {
            message = try decoder.decode(Message.self, from: data)
        } catch {
            print("deu ruim")
            return
        }
        
        switch message {
        case .candidate(let iceCandidate):
            self.delegate?.signalClient(self, didReceiveCandidate: iceCandidate.rtcIceCandidate)
        case .sdp(let sessionDescription):
            self.delegate?.signalClient(self, didReceiveRemoteSdp: sessionDescription.rtcSessionDescription)
        }
    }
    
}
