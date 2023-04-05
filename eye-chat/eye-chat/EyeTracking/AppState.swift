//
//  AppState.swift
//  eye-chat
//
//  Created by alexdamascena on 05/04/23.
//

import Foundation


class AppState: ObservableObject {
    static let shared = AppState()
    
    @Published var gameID = UUID()
}
