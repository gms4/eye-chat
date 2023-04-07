//
//  VideoView.swift
//  eye-chat
//
//  Created by alexdamascena on 07/04/23.
//  
//

import SwiftUI

struct VideoView: View {
    
    @EnvironmentObject var coordinator: ViewCoordinator
    @ObservedObject private var viewModel = VideoViewModel()
    
    @State var web = ConnectionSingleton.shared
       
    var body: some View {
        
        ZStack {
            web.connection
        }.overlay {
            
            VStack (alignment: .center, spacing: 32) {
                
                Button("Offer"){
                    web.connection.webRTCClient.offer{ sdp in
                        web.connection.signalingClient.send(sdp: sdp)
                    }
                    
                }
                
                Button("Answer"){
                    web.connection.webRTCClient.answer{ localSdp in
                        web.connection.signalingClient.send(sdp: localSdp)
                    }
                }
                
                Button("Send Message"){
                    guard let dataToSend = "ta funcionando".data(using: .utf8) else { return }
                    web.connection.webRTCClient.sendData(dataToSend)
                }
                
                Button("Video"){
                    coordinator.push(new: .video)
                }
            }
        }
    }
}

struct Video_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
