//
//  HomeV2View.swift
//  eye-chat
//
//  Created by alexdamascena on 03/04/23.
//  
//

import SwiftUI

struct HomeV2View: View {

    @ObservedObject private var viewModel = HomeV2ViewModel()
    @EnvironmentObject var coordinator: ViewCordinator
            
    public func didUserTapSavedRooms(){
        coordinator.push(view: .savedRooms)
    }
    
    public func didUserTapCreateRooms(){
        coordinator.push(view: .main)
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

//struct HomeV2_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeV2View()
//    }
//}
