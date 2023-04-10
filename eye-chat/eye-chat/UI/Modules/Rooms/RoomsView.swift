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
    
    public func teste1(){
        offerRoom()
        coordinator.push(view: .calling)
    }
    
    public func teste2(){
        offerRoom()
        coordinator.push(view: .calling)
    }
    
    public func teste3(){
        offerRoom()
        coordinator.push(view: .calling)
    }
    
    public func teste4(){
        answerRoom()
        coordinator.push(view: .calling)
  
    }
    
    public func teste5(){
        answerRoom()
        coordinator.push(view: .calling)
 
    }
    
    public func teste6(){
        answerRoom()
        coordinator.push(view: .calling)

    }
    
    public func teste7(){
        answerRoom()
        coordinator.push(view: .calling)

    }
    
    public func teste8(){
        answerRoom()
        coordinator.push(view: .calling)

    }
    
    public func teste9(){
        answerRoom()
        coordinator.push(view: .calling)
   
    }
    
    public func answerRoom(){
        web.connection.webRTCClient.answer{ localSdp in
            web.connection.signalingClient.send(sdp: localSdp)
        }
    }
    
    public func offerRoom(){
        
        web.connection.webRTCClient.offer{ sdp in
            web.connection.signalingClient.send(sdp: sdp)
        }
    }
    
    
    var body: some View {
        VStack {
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
