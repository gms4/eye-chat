//
//  RoomsView.swift
//  eye-chat
//
//  Created by alexdamascena on 10/04/23.
//  
//

import SwiftUI

struct RoomsView: View {
    
    @EnvironmentObject var coordinator: ViewCordinator
    
    @State var web = ConnectionSingleton.shared
    
    public func goBack(){
        coordinator.pop()
    }
    
    
    init(){
        
    }
    public func teste1(){
        joinRoom()
    }
    
    public func teste2(){
        joinRoom()
    }
    
    public func teste3(){
        joinRoom()

    }
    
    public func teste4(){
        joinRoom()
    }
    
    public func teste5(){
        joinRoom()
    }
    
    public func teste6(){
        joinRoom()

    }
    
    public func teste7(){
        joinRoom()
    }
    
    public func teste8(){
        joinRoom()
    }
    
    public func teste9(){
        joinRoom()

    }
        
    public func joinRoom(){
        
        web.connection.webRTCClient.offer{ sdp in
            web.connection.signalingClient.send(sdp: sdp)
        }
        
        web.connection.webRTCClient.answer{ localSdp in
            web.connection.signalingClient.send(sdp: localSdp)
        }
    }
    
    
    var body: some View {
        ZStack {
            web.connection
            EyeTrackingTemplate(
                axisXFirstSectionTrigger: [teste1, teste2, teste3],
                axisXSecondSectionTrigger: [teste4, teste5, teste6],
                axisXThirdSectionTrigger: [teste7, teste8, teste9],
                goBack: goBack,
                style: StyleCard(spacing: 0, borderColor: .yellow),
                elements: [ SavedRoomsCardComponent(cardTitle: "teste", cardColor: "blue-textfield").anyView,
                            SavedRoomsCardComponent(cardTitle: "teste", cardColor: "light-yellow-card").anyView,
                            SavedRoomsCardComponent(cardTitle: "teste", cardColor: "light-orange-card").anyView,
                            SavedRoomsCardComponent(cardTitle: "teste", cardColor: "light-yellow-card").anyView,
                            SavedRoomsCardComponent(cardTitle: "teste", cardColor: "light-orange-card").anyView,
                            SavedRoomsCardComponent(cardTitle: "teste", cardColor: "blue-textfield").anyView,
                            SavedRoomsCardComponent(cardTitle: "teste", cardColor: "blue-textfield").anyView,
                            SavedRoomsCardComponent(cardTitle: "teste", cardColor: "blue-textfield").anyView,
                            SavedRoomsCardComponent(cardTitle: "teste", cardColor: "light-orange-card").anyView,
                          ]
            )
            .padding(.bottom, UIScreen.screenHeight/2.5)
        }.overlay {
            VStack(alignment: .leading) {
                HStack {
                    Text(ContentComponent.SAVED_ROOMS)
                        .font(.custom(ContentComponent.M, size: 44))
                        .fontWeight(.bold)

                    Spacer()
                }
          
                Spacer()
                
            }.frame(width: UIScreen.screenWidth - 70, height: UIScreen.screenHeight * 0.84)
        }
    }
}

struct Rooms_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView()
    }
}
