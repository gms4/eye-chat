//
//  RoomCreatedPopupComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 01/04/23.
//

import SwiftUI

struct RoomCreatedPopupComponent: View {
    
    public func didUserTapOffer(){
        coordinator.push(view: .emojiComponent)
    }
    
    public func didUserTapReceive(){
        coordinator.push(view: .main)
    }
    
    @EnvironmentObject var coordinator: ViewCordinator
    
    var body: some View {
        VStack (spacing: 70) {
            Spacer(minLength: 75.su)
            Text("SAULO")
                .font(.custom(ContentComponent.B, size: 60))
            VStack {
                EyeTrackingTemplate(
                    upTrigger: didUserTapOffer,
                    downTrigger: didUserTapReceive,
                    style: StyleCard(spacing: 18, borderColor: .black),
                    elements: [ OfferOrReceiveComponent(style: .offer).anyView,
                                OfferOrReceiveComponent(style: .receive).anyView]
                )
            }
            Spacer()
            
        }
        .frame(maxWidth: 113.14.su, maxHeight: 135.71.su)
        .background(Image(ImageAsset.CALLING_POPUP))
    }
}

struct RoomCreatedPopupComponent_Previews: PreviewProvider {
    static var previews: some View {
        RoomCreatedPopupComponent()
    }
}
