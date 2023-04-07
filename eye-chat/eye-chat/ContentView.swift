//
//  ContentView.swift
//  eye-chat
//
//  Created by alexdamascena on 28/03/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
//    @EnvironmentObject var coordinator: ViewCoordinator

    var body: some View {
        VStack {
            
        }
//        NavigationStack(path: coordinator.path){
////            screen
//            HomeView()
//                .navigationDestination(for: RouteScreen.self){ route in
//                    switch route {
//                    case .main:
//                        ContentView() // change this view
//                    case .create:
//                        ContentView() // change this view
//                            .background(.black)
//                    case .video:
//                        VideoStream(webRTCClient: ConnectionSingleton.shared.connection.webRTCClient)
//                    }
//                }
//        }
    }
    
    private var screen: some View {
        CreateRoomView(style: .activate) // change this view
            .navigationDestination(for: RouteScreen.self){ route in
                switch route {
                case .main:
                    ContentView() // change this view
                case .create:
                    ContentView() // change this view
                        .background(.black)
                case .video:
                    VideoStream(webRTCClient: ConnectionSingleton.shared.connection.webRTCClient)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
