//
//  CallingViewModel.swift
//  eye-chat
//
//  Created by alexdamascena on 10/04/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class CallingViewModel: ObservableObject {
    @Published var example: String?
}