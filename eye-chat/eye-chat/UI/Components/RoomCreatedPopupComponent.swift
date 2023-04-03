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
            Text("Sala Criada!")
                .font(.system(size: 48, weight: .bold))
            Text("Ligando para Saulo...")
                .font(.system(size: 40))
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
