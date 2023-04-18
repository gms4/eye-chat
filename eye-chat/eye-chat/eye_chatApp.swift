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
    @ObservedObject var coordinator = ViewCordinator()
    
    @StateObject var appState = AppState.shared
    
    @State var web = ConnectionSingleton.shared

    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *){
                NavigationStack(path: $coordinator.path){
                    HomeV2View()
                    .id(appState.gameID)
                    .navigationDestination(for: RouteScreen.self){ destination in
                        switch destination {
                        case .main:
                            ThirdView()
                        case .create:
                            ThirdView()
                        case .video:
                            VideoView()
                        case .videoStream:
//                            VideoStream(webRTCClient: web.connection.webRTCClient)
                            VideoView()
                        case .savedRooms:
                            RoomsView()
                        case .topicsComponent:
                            TopicsBoardComponent()
                        case .emojiComponent:
                            KeyboardReactionsComponent()
                        case .fullKeyboard:
                            ChatScreenView(cameraSizeStyle: .small, keycapStyle: .aeiou)
                        }
                    }
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(coordinator)
            }
        }
    }
}
