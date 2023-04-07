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
    @ObservedObject var coordinator = ViewCoordinator()
    @State var web = ConnectionSingleton.shared
    
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *){
                NavigationStack(path: $coordinator.path){
                    HomeView(style: .activate)
                        .navigationDestination(for: RouteScreen.self){ destination in
                            switch destination {
                            case .main:
                                VideoStream(webRTCClient: web.connection.webRTCClient)
                            case .create:
                                VideoStream(webRTCClient: web.connection.webRTCClient)
                            case .video:
                                VideoStream(webRTCClient: web.connection.webRTCClient)
                            }
                        }
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(coordinator)
            }
        }
    }
}
