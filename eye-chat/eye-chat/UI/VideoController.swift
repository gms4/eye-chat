//
//  VideoController.swift
//  eye-chat
//
//  Created by alexdamascena on 05/04/23.
//

import Foundation
import SwiftUI
import WebRTC

struct VideoController: UIViewControllerRepresentable {

    class Coordinator: NSObject, SignalClientDelegate, WebRTCClientDelegate {
        
        var parent: VideoController?
        
        init(_ parent: VideoController){
            self.parent = parent
        }
        
        
        func signalClientDidConnect(_ signalClient: SignalingClient) {
            print("signaling connected")
        }
        
        func signalClientDidDisconnect(_ signalClient: SignalingClient) {
            print("signaling desconnected")
        }
        
        func signalClient(_ signalClient: SignalingClient, didReceiveRemoteSdp sdp: RTCSessionDescription) {
            self.parent?.webRTCClient.set(remoteSdp: sdp){ (error) in
                print("set remote")
            }
        }
        
        func signalClient(_ signalClient: SignalingClient, didReceiveCandidate candidate: RTCIceCandidate) {
            self.parent?.webRTCClient.set(remoteCandidate: candidate) { error in
                print("Received remote candidate")
            }
        }
        
        
        func webRTCClient(_ client: WebRTCClient, didDiscoverLocalCandidate candidate: RTCIceCandidate) {
            print("discovered local candidate")
            self.parent?.signalingClient.send(candidate: candidate)
        }
        
        func webRTCClient(_ client: WebRTCClient, didChangeConnectionState state: RTCIceConnectionState) {
            
        }
        
        func webRTCClient(_ client: WebRTCClient, didReceiveData data: Data) {
            let message = String(data: data, encoding: .utf8) ?? "(Binary: \(data.count) bytes)"
            print(message)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    let signalingClient = SignalingClient(webSocket: NativeWebSocket(url: VideoConfig.EYE_CHAT_DEFAULT.signaling))
    let webRTCClient = WebRTCClient(iceServers: VideoConfig.EYE_CHAT_DEFAULT.servers)
        
    func makeUIViewController(context: Context) -> ConnectionController {
        signalingClient.delegate = context.coordinator
        webRTCClient.delegate = context.coordinator
   
        let view = ConnectionController(signalClient: signalingClient, webRTCClient: webRTCClient)
        view.signalClient.connect()
        
        return view
    }
    
    func updateUIViewController(_ uiViewController: ConnectionController, context: Context) {
        
    }
    


    
    
}
