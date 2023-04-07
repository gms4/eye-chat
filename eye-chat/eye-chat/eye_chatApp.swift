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
//    @ObservedObject var coordinator = ViewCordinator()
    
    @StateObject var appState = AppState.shared

    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *){
                NavigationStack(){
                    FaceIDAuthView()
                    .id(appState.gameID)
                    .navigationDestination(for: RouteScreen.self){ destination in
                        switch destination {
                        case .main:
                            ThirdView()
                        case .create:
                            ThirdView()
                        }
                    }
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                .environmentObject(coordinator)
            }
        }
    }
}
