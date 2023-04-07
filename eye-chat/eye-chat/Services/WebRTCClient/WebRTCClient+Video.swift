//
//  WebRTCClient+Video.swift
//  eye-chat
//
//  Created by alexdamascena on 07/04/23.
//

import SwiftUI
import WebRTC

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
