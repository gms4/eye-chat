//
//  EyeTrackingViewController.swift
//  eye-chat
//
//  Created by alexdamascena on 05/04/23.
//

import Foundation

import UIKit
import EyeTracking
import SwiftUI


class EyeTrackingViewController: UIViewController {
    
    var viewModel: EyeTrackingViewModel?
    
    let eyeTracking = EyeTracking(configuration: Configuration(appID: "ios-eye-tracking"))
    var sessionID: String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewSession()
        eyeTracking.update = getPointer
        eyeTracking.blinkedEyes = blinkEyes
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        eyeTracking.showPointer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        eyeTracking.hidePointer()
    }

    
    func startNewSession() {
       if eyeTracking.currentSession != nil {
           // Only keep 1 current session data
           let session = self.eyeTracking.currentSession
           eyeTracking.endSession()
           try? EyeTracking.delete(session!)
       }

       eyeTracking.startSession()
       eyeTracking.loggingEnabled = false
       sessionID = eyeTracking.currentSession?.id
    }
    
    func getPointer(CGRect: CGRect){
        viewModel?.pointer = CGRect
    }
    
    func blinkEyes(){
        viewModel?.selected.toggle()
    }

}
