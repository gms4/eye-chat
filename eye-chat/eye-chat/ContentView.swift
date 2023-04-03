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

    var body: some View {
        NavigationStack {
            screen
        }
    }
    
    private var screen: some View {
        HomeV2View() // change this view
            .navigationDestination(for: RouteScreen.self){ route in
                switch route {
                case .main:
                    ContentView() // change this view
                case .create:
                    ContentView() // change this view
                        .background(.black)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
