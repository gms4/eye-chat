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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
