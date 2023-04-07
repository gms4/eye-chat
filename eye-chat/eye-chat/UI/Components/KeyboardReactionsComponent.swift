//
//  KeyboardComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 29/03/23.
//

import SwiftUI

struct KeyboardReactionsComponent: View {
    var body: some View {
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
    }
}

struct KeyboardReactionsComponent_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardReactionsComponent()
    }
}
