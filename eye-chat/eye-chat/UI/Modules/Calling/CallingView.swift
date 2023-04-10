//
//  CallingView.swift
//  eye-chat
//
//  Created by alexdamascena on 10/04/23.
//  
//

import SwiftUI

struct CallingView: View {

    @ObservedObject private var viewModel = CallingViewModel()
       
    @EnvironmentObject var coordinator: ViewCordinator
    @State var web = ConnectionSingleton.shared
            
    public func didUserTapSavedRooms(){
//        coordinator.push(view: .savedRooms)
        web.connection.webRTCClient.offer{ sdp in
            web.connection.signalingClient.send(sdp: sdp)
        }
    }
    
    public func didUserTapCreateRooms(){
        print("entrou aqui")
        web.connection.webRTCClient.answer{ localSdp in
            web.connection.signalingClient.send(sdp: localSdp)
        }
    }
    
    var body: some View {
        VStack {
            EyeTrackingTemplate(
                upTrigger: didUserTapSavedRooms,
                downTrigger: didUserTapCreateRooms,
                style: StyleCard(spacing: 36, borderColor: .black),
                elements: [ EyeButtonComponent(style: .savedRoom).anyView,
                            EyeButtonComponent(style: .createRoom).anyView]
            )
        }
        .padding(.top, 45)
        .overlay {
            VStack(alignment: .leading) {
                HStack {
                    Text(ContentComponent.INITIATE_CHAT)
                        .font(.custom(ContentComponent.M, size: 44))
                    Spacer()
                }
          
                Spacer()
                
            }.frame(width: UIScreen.screenWidth - 70, height: UIScreen.screenHeight * 0.9)
        }
    }
}

struct Calling_Previews: PreviewProvider {
    static var previews: some View {
        CallingView()
    }
}
