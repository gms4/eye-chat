//
//  RoomsView.swift
//  eye-chat
//
//  Created by alexdamascena on 10/04/23.
//  
//

import SwiftUI
import SocketIO

class OfferSingleton {
    
    static let shared = OfferSingleton()
    var index = 0;
    
    private init(){}
}

struct Server: Codable {
    let offer: Bool
    
}


struct RoomsView: View {
    
    @EnvironmentObject var coordinator: ViewCordinator
    
    var web = ConnectionSingleton.shared
        
    
    public func goBack(){
        coordinator.pop()
    }
    
    init(){
        web.connection.webRTCClient.speakerOff()
        OfferSingleton.shared.index += 1

        if(OfferSingleton.shared.index == 1){
            createRequest()
        }
    }
    
    
    public func createRequest(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            Task {
                let offer = await makeOfferRequest()

                if offer {
                    print("ENTROU NO OFFER")
                    web.connection.webRTCClient.offer{ (sdp) in
                        web.connection.signalingClient.send(sdp: sdp)
                    }
                } else {
                    print("ENTROU NO ANSWER")
                    web.connection.webRTCClient.answer{ (localSdp) in
                        web.connection.signalingClient.send(sdp: localSdp)
                        
                    }
                }
            }
        }
    }
    
    public func makeOfferRequest() async -> Bool {
        let url = URL(string: "http://\(VideoConfig.EYE_CHAT_DEFAULT.server):8081")!
        
        let session = URLSession.shared
        let decoder = JSONDecoder()
        do {
            let (data, _) = try await session.data(from: url)
            let response = try decoder.decode(Server.self, from: data)
            return response.offer
        } catch {
            return false
        }
    }
   
    
    public func teste1(){
//        coordinator.push(view: .videoStream)
        
    }
    
    public func teste2(){
//        coordinator.push(view: .videoStream)
    }
    
    public func teste3(){
//        coordinator.push(view: .videoStream)

    }
    
    public func teste4(){
//        coordinator.push(view: .videoStream)
    }
    
    public func teste5(){
//        coordinator.push(view: .videoStream)

    }
    
    public func teste6(){
//        coordinator.push(view: .videoStream)
    }
    
    public func teste7(){
//        coordinator.push(view: .videoStream)
    }
    
    public func teste8(){
//        coordinator.push(view: .videoStream)
    }
    
    public func teste9(){
//        coordinator.push(view: .videoStream)

    }
        
    public func joinRoom(){
        
        web.connection.signalingClient.send(message: "offer clicked")

    }
    
    
    var body: some View {
        ZStack {
            EyeTrackingTemplate(
                axisXFirstSectionTrigger: [teste1, teste2, teste3],
                axisXSecondSectionTrigger: [teste4, teste5, teste6],
                axisXThirdSectionTrigger: [teste7, teste8, teste9],
                goBack: goBack,
                style: StyleCard(spacing: 0, borderColor: Color(ColorAsset.BLUE_COLOR)),
                elements: [ SavedRoomsCardComponent(cardTitle: "Roberto", cardColor: ColorAsset.BLUE_COLOR).anyView,
                            SavedRoomsCardComponent(cardTitle: "Claúdia", cardColor: ColorAsset.BLUE_COLOR).anyView,
                            SavedRoomsCardComponent(cardTitle: "Gui", cardColor: ColorAsset.BLUE_COLOR).anyView,
                            SavedRoomsCardComponent(cardTitle: "Arqui", cardColor: ColorAsset.BLUE_COLOR).anyView,
                            SavedRoomsCardComponent(cardTitle: "Miguel", cardColor: ColorAsset.BLUE_COLOR).anyView,
                            SavedRoomsCardComponent(cardTitle: "Miguelito", cardColor: ColorAsset.BLUE_COLOR).anyView,
                            SavedRoomsCardComponent(cardTitle: "Jorge", cardColor: ColorAsset.BLUE_COLOR).anyView,
                            SavedRoomsCardComponent(cardTitle: "Erne", cardColor: ColorAsset.BLUE_COLOR).anyView,
                            SavedRoomsCardComponent(cardTitle: "Bru", cardColor: ColorAsset.BLUE_COLOR).anyView,
                          ]
            )
            .background(
                
                VStack {
                    Image("Sala Salva")
                        .padding(.top, 260)
                }
     
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
