//
//  VideoConfig.swift
//  eye-chat
//
//  Created by alexdamascena on 01/04/23.
//

import Foundation

fileprivate let signalingServer = URL(string: "ws://10.48.48.63:8080")!


fileprivate let defaultIceServers = ["stun:stun.l.google.com:19302",
                                     "stun:stun1.l.google.com:19302",
                                     "stun:stun2.l.google.com:19302",
                                     "stun:stun3.l.google.com:19302",
                                     "stun:stun4.l.google.com:19302"]

struct VideoConfig {
    
    let signaling: URL
    let servers: [String]
    
    static let EYE_CHAT_DEFAULT = VideoConfig(signaling: signalingServer,
                                              servers: defaultIceServers)
    
}
