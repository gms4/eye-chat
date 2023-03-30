//
//  HomeViewModel.swift
//  eye-chat
//
//  Created by Guilherme Souza on 30/03/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class HomeViewModel: ObservableObject {
    @Published var example: String?
}