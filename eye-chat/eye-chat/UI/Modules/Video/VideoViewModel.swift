//
//  VideoViewModel.swift
//  eye-chat
//
//  Created by alexdamascena on 07/04/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class VideoViewModel: ObservableObject {
    @Published var example: String?
}