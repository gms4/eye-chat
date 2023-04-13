//
//  VideoStream.swift
//  eye-chat
//
//  Created by alexdamascena on 06/04/23.
//

import SwiftUI


struct VideoStream: UIViewControllerRepresentable {
    
    let webRTCClient: WebRTCClient
    
    func makeUIViewController(context: Context) -> VideoStreamViewController {
        webRTCClient.speakerOn()
        let video = VideoStreamViewController(webRTCClient: webRTCClient)
        return video
    }
    
    func updateUIViewController(_ uiViewController: VideoStreamViewController, context: Context) {
    }
}
