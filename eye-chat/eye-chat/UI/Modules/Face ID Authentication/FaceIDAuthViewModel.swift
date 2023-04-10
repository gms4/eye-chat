//
//  FaceIDAuthViewModel.swift
//  eye-chat
//
//  Created by Guilherme Souza on 04/04/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class FaceIDAuthViewModel: ObservableObject {
    @Published var example: String?
}