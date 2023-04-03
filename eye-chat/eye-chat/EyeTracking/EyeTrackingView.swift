//
//  EyeTrackingView.swift
//  eye-chat
//
//  Created by alexdamascena on 03/04/23.
//

import SwiftUI

struct EyeTrackingView: UIViewControllerRepresentable {
    
    typealias UIViewType = EyeTrackingViewController
    
    @ObservedObject var viewModel: EyeTrackingViewModel
    @Binding var endEyeTracking: Bool
    
    func makeUIViewController(context: Context) -> EyeTrackingViewController {
        let controller = EyeTrackingViewController()
        controller.viewModel = viewModel
        return controller
    }
    
    func updateUIViewController(_ uiViewController: EyeTrackingViewController, context: Context) {
        if endEyeTracking {
            uiViewController.eyeTracking.hidePointer()
        }
    }
}
