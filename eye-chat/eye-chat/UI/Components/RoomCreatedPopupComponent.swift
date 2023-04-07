//
//  RoomCreatedPopupComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 01/04/23.
//

import SwiftUI

struct RoomCreatedPopupComponent: View {
    var body: some View {
        VStack {
            Spacer(minLength: 83.su)
            Text(ContentComponent.ROOM_CREATED)
                .font(.custom(ContentComponent.B, size: 54))
            Text("Ligando para SAULO...")
                .font(.custom(ContentComponent.R, size: 44))
            Image(ImageAsset.GET_IN)
                .padding()
            //vai ser um botão
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
