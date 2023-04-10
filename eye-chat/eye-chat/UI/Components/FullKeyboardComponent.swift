//
//  FullKeyboardComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 30/03/23.
//

import SwiftUI

struct FullKeyboardComponent: View {
    
    let chat: ChatStyle
    
    var body: some View {
        VStack (spacing: 35) {
            Grid() {
                GridRow {
                    KeycapsComponent(style: .aeiou)
                    KeycapsComponent(style: .srndm)
                    KeycapsComponent(style: .tclpv)
                }
                GridRow {
                    KeycapsComponent(style: .ghqbf)
                    KeycapsComponent(style: .zjxkw)
                    KeycapsComponent(style: .others)
                }
                HStack {
                    DeleteKeycapComponent()
                    SpaceKeycapComponent()
                    if chat == .inside {
                        PrintKeycapComponent()
                    } else {
                        CreateRoomComponent()
                    }
                }
                .frame(minHeight: UIScreen.screenHeight - 171.86.su)
            }
            HStack (alignment: .center) {
                Circle()
                    .fill(Color(ColorAsset.LIGHT_ORANGE))
                    .frame(width: 14, height: 14)
                Circle()
                    .fill(Color(ColorAsset.LIGHT_ORANGE))
                    .frame(width: 14, height: 14)
                Circle()
                    .fill(Color(ColorAsset.PET_ORANGE))
                    .frame(width: 14, height: 14)
            }
        }
    }
}

struct FullKeyboardComponent_Previews: PreviewProvider {
    static var previews: some View {
        FullKeyboardComponent(chat: .outside)
    }
}
