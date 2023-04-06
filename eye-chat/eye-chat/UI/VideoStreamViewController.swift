//
//  VideoStreamViewController.swift
//  eye-chat
//
//  Created by alexdamascena on 06/04/23.
//

import UIKit
import WebRTC

class VideoStreamViewController: UIViewController {

    private var localVideoView = UIView()
    private let webRTCClient: WebRTCClient

    init(webRTCClient: WebRTCClient) {
       self.webRTCClient = webRTCClient
       super.init(nibName: nil, bundle: nil)
   }
       
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
       
   override func viewDidLoad() {
       super.viewDidLoad()
       
       let localRenderer = RTCMTLVideoView(frame: self.localVideoView.frame)
       let remoteRenderer = RTCMTLVideoView(frame: self.view.frame)
       localRenderer.videoContentMode = .scaleAspectFill
       remoteRenderer.videoContentMode = .scaleAspectFill
       

       self.webRTCClient.startCaptureLocalVideo(renderer: localRenderer)
       self.webRTCClient.renderRemoteVideo(to: remoteRenderer)
       
       self.embedView(localRenderer, into: self.localVideoView)
       self.embedView(remoteRenderer, into: self.view)
       self.view.sendSubviewToBack(remoteRenderer)
   }
       
   private func embedView(_ view: UIView, into containerView: UIView) {
       containerView.addSubview(view)
       view.translatesAutoresizingMaskIntoConstraints = false
       containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["view":view]))
       
       containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["view":view]))
       containerView.layoutIfNeeded()
   }
}

