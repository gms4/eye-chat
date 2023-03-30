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
        }
    }
}

struct FullKeyboardComponent_Previews: PreviewProvider {
    static var previews: some View {
        FullKeyboardComponent(chat: .outside)
    }
}
