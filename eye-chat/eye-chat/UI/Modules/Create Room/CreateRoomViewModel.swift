//
//  CreateRoomViewModel.swift
//  eye-chat
//
//  Created by Guilherme Souza on 31/03/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class CreateRoomViewModel: ObservableObject {
    @Published var example: String?
}