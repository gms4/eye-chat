//
//  eye_chatApp.swift
//  eye-chat
//
//  Created by alexdamascena on 28/03/23.
//

import SwiftUI

@main
struct eye_chatApp: App {
    
    let persistenceController = PersistenceController.shared
    let signaling = SignalingClient()
    let webRTCClient = WebRTCClient(iceServers: VideoConfig.EYE_CHAT_DEFAULT.servers)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(signaling)
                .environmentObject(webRTCClient)
        }
    }
}
