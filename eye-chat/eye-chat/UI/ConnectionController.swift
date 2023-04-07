//
//  ConnectionController.swift
//  video-teste
//
//  Created by alexdamascena on 05/04/23.
//

import UIKit
import WebRTC

class ConnectionController: UIViewController {
    
    let signalClient: SignalingClient
    let webRTCClient: WebRTCClient
    
    
    init(signalClient: SignalingClient, webRTCClient: WebRTCClient) {
        self.signalClient = signalClient
        self.webRTCClient = webRTCClient
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


    


