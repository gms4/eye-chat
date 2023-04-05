//
//  OpaViewModel.swift
//  eye-chat
//
//  Created by alexdamascena on 05/04/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class OpaViewModel: ObservableObject {
    @Published var example: String?
}