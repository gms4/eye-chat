//
//  EyeTrackingView.swift
//  eye-chat
//
//  Created by alexdamascena on 05/04/23.
//

import SwiftUI
import EyeTracking
import ARKit

struct EyeTrackingView: UIViewControllerRepresentable {
    
    typealias UIViewType = EyeTrackingViewController
    
    @ObservedObject var viewModel: EyeTrackingViewModel
    @Binding var endEyeTracking: Int
    
    func makeUIViewController(context: Context) -> EyeTrackingViewController {
        let controller = EyeTrackingViewController()
        controller.viewModel = viewModel
        return controller
    }
    
    func updateUIViewController(_ uiViewController: EyeTrackingViewController, context: Context) {
        
        if endEyeTracking == -1 {
            AppState.shared.gameID = UUID()
        }
 
    }
}
