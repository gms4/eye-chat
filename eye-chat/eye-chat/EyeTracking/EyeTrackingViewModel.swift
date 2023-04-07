//
//  EyeTrackingViewModel.swift
//  eye-chat
//
//  Created by alexdamascena on 07/04/23.
//

import SwiftUI

class EyeTrackingViewModel: ObservableObject {
    @Published var pointer: CGRect?
    @Published var selected: Bool = false
    @Published var update: Bool = false
}
