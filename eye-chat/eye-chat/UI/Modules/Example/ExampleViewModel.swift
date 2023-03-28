//
//  ExampleViewModel.swift
//  eye-chat
//
//  Created by alexdamascena on 28/03/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class ExampleViewModel: ObservableObject {
    @Published var example: String?
}