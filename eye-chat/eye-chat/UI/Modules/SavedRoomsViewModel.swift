//
//  SavedRoomsViewModel.swift
//  eye-chat
//
//  Created by egln on 04/04/23.
//
import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data
final class SavedRoomsViewModel: ObservableObject {
    
    
    @Published var example: [String] = ["Sala Teste 1", "Sala Teste 2", "Sala Teste 3", "Sala Teste 4"]
}
