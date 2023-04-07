//
//  WebRTCClient+TrackEnable.swift
//  eye-chat
//
//  Created by alexdamascena on 07/04/23.
//

import SwiftUI
import WebRTC

extension WebRTCClient {
    func setTrackEnabled<T: RTCMediaStreamTrack>(_ type: T.Type, isEnabled: Bool) {
        peerConnection.transceivers
            .compactMap { return $0.sender.track as? T }
            .forEach { $0.isEnabled = isEnabled }
    }
}
