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
struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    @EnvironmentObject var webRTCClient: WebRTCClient
    @EnvironmentObject var signaling: SignalingClient
    //    let style: EyetrackingStyle
    
    var body: some View {
        VStack (alignment: .center, spacing: 32) {
            
            Button("Offer"){
                self.webRTCClient.offer{ sdp in
                    self.signaling.send(sdp: sdp)
                }
            }
            
            Button("Answer"){
                self.webRTCClient.answer{ localSdp in
                    self.signaling.send(sdp: localSdp)
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
