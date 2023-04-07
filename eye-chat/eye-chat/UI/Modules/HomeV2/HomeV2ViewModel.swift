//
//  HomeV2ViewModel.swift
//  eye-chat
//
//  Created by alexdamascena on 03/04/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class HomeV2ViewModel: ObservableObject {
    @Published var example: String?
}