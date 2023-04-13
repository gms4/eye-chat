//
//  KeyboardComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 29/03/23.
//

import SwiftUI

struct KeyboardReactionsComponent: View {
    var body: some View {
        VStack (spacing: 35) {
            Grid {
                GridRow {
                    ReactionsComponent(style: .smileEmoji)
                    ReactionsComponent(style: .heartFaceEmoji)
                    ReactionsComponent(style: .laughEmoji)
                }
                GridRow {
                    ReactionsComponent(style: .cryingEmoji)
                    ReactionsComponent(style: .judgingEmoji)
                    ReactionsComponent(style: .angryEmoji)
                }
                GridRow {
                    ReactionsComponent(style: .sadEmoji)
                    ReactionsComponent(style: .omgEmoji)
                    ReactionsComponent(style: .thinkingEmoji)
                }
            }
            .frame(minHeight: UIScreen.screenHeight - 171.86.su)
            HStack (alignment: .center) {
                Circle()
                    .fill(Color(ColorAsset.PET_ORANGE))
                    .frame(width: 14, height: 14)
                Circle()
                    .fill(Color(ColorAsset.LIGHT_ORANGE))
                    .frame(width: 14, height: 14)
                Circle()
                    .fill(Color(ColorAsset.LIGHT_ORANGE))
                    .frame(width: 14, height: 14)
            }
        }
    }
}

struct KeyboardReactionsComponent_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardReactionsComponent()
    }
}
