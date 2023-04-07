//
//  HomeView.swift
//  eye-chat
//
//  Created by Guilherme Souza on 29/03/23.
//
//

import SwiftUI


enum EyetrackingStyle {
    
    case activate
    case deactivate
}

class ConnectionSingleton {
    
    static let shared = ConnectionSingleton()
    let connection = Connection()
    
    private init(){}
}
struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    @EnvironmentObject var coordinator: ViewCoordinator
    
    //    let style: EyetrackingStyle
    
    let video: Connection
    
//    @State var isVideoOn = false
    
    @State var web = ConnectionSingleton.shared
    
    init(){
        self.video = Connection()
    }
    
    var body: some View {
        
        ZStack {
            web.connection
        }.overlay {
            
            VStack (alignment: .center, spacing: 32) {

                Button("Offer"){
//                    self.video.webRTCClient.offer{ sdp in
//                        self.video.signalingClient.send(sdp: sdp)
//                    }
//                    ConnectionSingleton.shared.connection.webRTCClient.offer{ sdp in
//
//                    }
                    
                    web.connection.webRTCClient.offer{ sdp in
                        web.connection.signalingClient.send(sdp: sdp)
                    }
                    
                }
                
                Button("Answer"){
                    web.connection.webRTCClient.answer{ localSdp in
                        web.connection.signalingClient.send(sdp: localSdp)
                        
                    }
//                    self.video.webRTCClient.answer{ localSdp in
//                        self.video.signalingClient.send(sdp: localSdp)
//                    }
                }
                
                Button("Send Message"){
                    guard let dataToSend = "rola que tal".data(using: .utf8) else { return }
//                    self.video.webRTCClient.sendData(dataToSend)
                    web.connection.webRTCClient.sendData(dataToSend)
                }
                
                Button("Video"){
                    coordinator.push(new: .video)
                }
            }
        
            //            VStack (alignment: .leading, spacing: 5.14.su) {
            //                Text("Inicie uma conversa com EyeChat!")
            //                    .font(.system(size: 40, weight:.medium))
            //                EyeButtonComponent(style: .savedRoom)
            //                EyeButtonComponent(style: .createRoom)
            //                Image(style == .activate ? ImageAsset.DEACTIVATE_EYETRACKING : ImageAsset.ACTIVATE_EYETRACKING)
            //            }
        }
        //        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //        .overlay(alignment: .topTrailing) {
        //            Image("logo-screens")
        //                .frame(maxWidth: 20.su, maxHeight: 17.14.su)
        //        }
        //        .overlay(alignment: .bottomLeading) {
        //            Image(style == .activate ? ImageAsset.DEACTIVATE_EYETRACKING : ImageAsset.ACTIVATE_EYETRACKING)
        //                .frame(maxWidth: 110, maxHeight: 130)
        //            }
        //        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
