//
//  ViewController.swift
//  video-teste
//
//  Created by alexdamascena on 05/04/23.
//

import UIKit
import WebRTC

class ViewController: UIViewController {
    
    let signalClient: SignalingClient
    let webRTCClient: WebRTCClient
//       private lazy var videoViewController = VideoViewController(webRTCClient: self.webRTCClient)
       
//    var speakerButton: UIButton = {
//
//    }()
    
    
    var signalingStatusLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
       var localSdpStatusLabel: UILabel = {
           let label = UILabel()
           return label
       }()
       var localCandidatesLabel: UILabel = {
           let label = UILabel()
           return label
       }()
       var remoteSdpStatusLabel: UILabel = {
           let label = UILabel()
           return label
       }()
       var remoteCandidatesLabel: UILabel = {
           let label = UILabel()
           return label
       }()
//       var muteButton: UIButton?
       var webRTCStatusLabel: UILabel = {
           let label = UILabel()
           return label
       }()
    
    var offerButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.setTitle("Offer", for: .normal)
        return button
    }()
    
    var answerButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.setTitle("Answer", for: .normal)
        return button
    }()
    
    var sendMessageButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.setTitle("Send Message", for: .normal)
        return button
    }()
       
       private var signalingConnected: Bool = false {
           didSet {
               DispatchQueue.main.async {
                   if self.signalingConnected {
                       self.signalingStatusLabel.text = "Connected"
                       self.signalingStatusLabel.textColor = UIColor.green
                   }
                   else {
                       self.signalingStatusLabel.text = "Not connected"
                       self.signalingStatusLabel.textColor = UIColor.red
                   }
               }
           }
       }
       
       private var hasLocalSdp: Bool = false {
           didSet {
               DispatchQueue.main.async {
                   self.localSdpStatusLabel.text = self.hasLocalSdp ? "✅" : "❌"
               }
           }
       }
       
       private var localCandidateCount: Int = 0 {
           didSet {
               DispatchQueue.main.async {
                   self.localCandidatesLabel.text = "\(self.localCandidateCount)"
               }
           }
       }
       
       private var hasRemoteSdp: Bool = false {
           didSet {
               DispatchQueue.main.async {
                   self.remoteSdpStatusLabel.text = self.hasRemoteSdp ? "✅" : "❌"
               }
           }
       }
       
       private var remoteCandidateCount: Int = 0 {
           didSet {
               DispatchQueue.main.async {
                   self.remoteCandidatesLabel.text = "\(self.remoteCandidateCount)"
               }
           }
       }
       
//       private var speakerOn: Bool = false {
//           didSet {
//               let title = "Speaker: \(self.speakerOn ? "On" : "Off" )"
//               self.speakerButton?.setTitle(title, for: .normal)
//           }
//       }
       
//       private var mute: Bool = false {
//           didSet {
//               let title = "Mute: \(self.mute ? "on" : "off")"
//               self.muteButton?.setTitle(title, for: .normal)
//           }
//       }
       
       init(signalClient: SignalingClient, webRTCClient: WebRTCClient) {
           self.signalClient = signalClient
           self.webRTCClient = webRTCClient
           super.init(nibName: nil, bundle: nil)
       }
       
       @available(*, unavailable)
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func viewDidLoad() {
           super.viewDidLoad()
//           setupContent()
           self.title = "WebRTC Demo"
           self.signalingConnected = false
           self.hasLocalSdp = false
           self.hasRemoteSdp = false
           self.localCandidateCount = 0
           self.remoteCandidateCount = 0
//           self.speakerOn = false
//           self.webRTCStatusLabel?.text = "New"
           
//           self.webRTCClient.delegate = self
//           self.signalClient.delegate = self
//           self.signalClient.connect()
           
//           offerButton.addTarget(nil, action: #selector(offerDidTap), for: .touchUpInside)
//           answerButton.addTarget(nil, action: #selector(answerDidTap), for: .touchUpInside)
//           sendMessageButton.addTarget(nil, action: #selector(sendDataDidTap), for: .touchUpInside)
       }
    
//    private func setupContent(){
//        view.addSubview(signalingStatusLabel)
//        view.addSubview(localSdpStatusLabel)
//        view.addSubview(localCandidatesLabel)
//        view.addSubview(remoteSdpStatusLabel)
//        view.addSubview(remoteCandidatesLabel)
//        view.addSubview(webRTCStatusLabel)
//        view.addSubview(offerButton)
//        view.addSubview(answerButton)
//        view.addSubview(sendMessageButton)
//
//        signalingStatusLabel.translatesAutoresizingMaskIntoConstraints = false
//        localSdpStatusLabel.translatesAutoresizingMaskIntoConstraints = false
//        localCandidatesLabel.translatesAutoresizingMaskIntoConstraints = false
//        remoteSdpStatusLabel.translatesAutoresizingMaskIntoConstraints = false
//        remoteCandidatesLabel.translatesAutoresizingMaskIntoConstraints = false
//        webRTCStatusLabel.translatesAutoresizingMaskIntoConstraints = false
//        offerButton.translatesAutoresizingMaskIntoConstraints = false
//        answerButton.translatesAutoresizingMaskIntoConstraints = false
//        sendMessageButton.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            signalingStatusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            signalingStatusLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//
//            localSdpStatusLabel.centerXAnchor.constraint(equalTo: signalingStatusLabel.centerXAnchor),
//            localSdpStatusLabel.topAnchor.constraint(equalTo: signalingStatusLabel.bottomAnchor, constant: 24),
//
//            localCandidatesLabel.centerXAnchor.constraint(equalTo: localSdpStatusLabel.centerXAnchor),
//            localCandidatesLabel.topAnchor.constraint(equalTo: localSdpStatusLabel.bottomAnchor, constant: 24),
//
//            remoteSdpStatusLabel.centerXAnchor.constraint(equalTo: localCandidatesLabel.centerXAnchor),
//            remoteSdpStatusLabel.topAnchor.constraint(equalTo: localCandidatesLabel.bottomAnchor, constant: 24),
//
//            remoteCandidatesLabel.centerXAnchor.constraint(equalTo: localCandidatesLabel.centerXAnchor),
//            remoteCandidatesLabel.topAnchor.constraint(equalTo: localCandidatesLabel.bottomAnchor, constant: 24),
//
//            webRTCStatusLabel.centerXAnchor.constraint(equalTo: remoteCandidatesLabel.centerXAnchor),
//            webRTCStatusLabel.topAnchor.constraint(equalTo: remoteCandidatesLabel.bottomAnchor, constant: 24),
//
//            offerButton.centerXAnchor.constraint(equalTo: webRTCStatusLabel.centerXAnchor),
//            offerButton.topAnchor.constraint(equalTo: webRTCStatusLabel.bottomAnchor, constant: 24),
//
//            answerButton.centerXAnchor.constraint(equalTo: offerButton.centerXAnchor),
//            answerButton.topAnchor.constraint(equalTo: offerButton.bottomAnchor, constant: 64),
//
//            sendMessageButton.centerXAnchor.constraint(equalTo: answerButton.centerXAnchor),
//            sendMessageButton.topAnchor.constraint(equalTo: answerButton.bottomAnchor, constant: 64),
//
//
//
//
//        ])
//
//
//
//    }
       
//       @objc private func offerDidTap(_ sender: UIButton) {
//           self.webRTCClient.offer { (sdp) in
//               self.hasLocalSdp = true
//               self.signalClient.send(sdp: sdp)
//           }
//       }
//
//        @objc private func answerDidTap(_ sender: UIButton) {
//           self.webRTCClient.answer { (localSdp) in
//               self.hasLocalSdp = true
//               self.signalClient.send(sdp: localSdp)
//           }
//       }
       
//       @IBAction private func speakerDidTap(_ sender: UIButton) {
//           if self.speakerOn {
//               self.webRTCClient.speakerOff()
//           }
//           else {
//               self.webRTCClient.speakerOn()
//           }
//           self.speakerOn = !self.speakerOn
//       }
       
//        @objc private func videoDidTap(_ sender: UIButton) {
//           self.present(videoViewController, animated: true, completion: nil)
//       }
       
//       @IBAction private func muteDidTap(_ sender: UIButton) {
//           self.mute = !self.mute
//           if self.mute {
//               self.webRTCClient.muteAudio()
//           }
//           else {
//               self.webRTCClient.unmuteAudio()
//           }
//       }
       
//        @objc func sendDataDidTap(_ sender: UIButton) {
//           let alert = UIAlertController(title: "Send a message to the other peer",
//                                         message: "This will be transferred over WebRTC data channel",
//                                         preferredStyle: .alert)
//           alert.addTextField { (textField) in
//               textField.placeholder = "Message to send"
//           }
//           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//           alert.addAction(UIAlertAction(title: "Send", style: .default, handler: { [weak self, unowned alert] _ in
//               guard let dataToSend = alert.textFields?.first?.text?.data(using: .utf8) else {
//                   return
//               }
//               self?.webRTCClient.sendData(dataToSend)
//           }))
//           self.present(alert, animated: true, completion: nil)
//       }
}

//extension ViewController: SignalClientDelegate {
//   func signalClientDidConnect(_ signalClient: SignalingClient) {
//       self.signalingConnected = true
//   }
//   
//   func signalClientDidDisconnect(_ signalClient: SignalingClient) {
//       self.signalingConnected = false
//   }
//   
//   func signalClient(_ signalClient: SignalingClient, didReceiveRemoteSdp sdp: RTCSessionDescription) {
//       print("Received remote sdp")
//       self.webRTCClient.set(remoteSdp: sdp) { (error) in
//           self.hasRemoteSdp = true
//       }
//   }
//   
//   func signalClient(_ signalClient: SignalingClient, didReceiveCandidate candidate: RTCIceCandidate) {
//       self.webRTCClient.set(remoteCandidate: candidate) { error in
//           print("Received remote candidate")
//           self.remoteCandidateCount += 1
//       }
//   }
//}
//
//extension ViewController: WebRTCClientDelegate {
//   
//   func webRTCClient(_ client: WebRTCClient, didDiscoverLocalCandidate candidate: RTCIceCandidate) {
//       print("discovered local candidate")
//       self.localCandidateCount += 1
//       self.signalClient.send(candidate: candidate)
//   }
//   
//   func webRTCClient(_ client: WebRTCClient, didChangeConnectionState state: RTCIceConnectionState) {
////       let textColor: UIColor
////       switch state {
////       case .connected, .completed:
////           textColor = .green
////       case .disconnected:
////           textColor = .orange
////       case .failed, .closed:
////           textColor = .red
////       case .new, .checking, .count:
////           textColor = .black
////       @unknown default:
////           textColor = .black
////       }
////       DispatchQueue.main.async {
////           self.webRTCStatusLabel?.text = state.description.capitalized
////           self.webRTCStatusLabel?.textColor = textColor
////       }
//   }
//   
//   func webRTCClient(_ client: WebRTCClient, didReceiveData data: Data) {
//       DispatchQueue.main.async {
//           let message = String(data: data, encoding: .utf8) ?? "(Binary: \(data.count) bytes)"
//           let alert = UIAlertController(title: "Message from WebRTC", message: message, preferredStyle: .alert)
//           alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//         
// self.present(alert, animated: true, completion: nil)
//       }
//   }
//}


    


