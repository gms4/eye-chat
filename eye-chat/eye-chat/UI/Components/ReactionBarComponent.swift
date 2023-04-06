//
//  ReactionBarComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 04/04/23.
//

import SwiftUI

struct ReactionBarComponent: View {
    let style: CameraSizeStyle
    var body: some View {
        VStack {
            Text("🤔")
                .font(.system(size: 100))
        }
        .frame(maxWidth: .infinity, maxHeight: style == .small ? 156.35 : 275)
        .background(Color(ColorAsset.REACTION_BAR_COLOR))
    }
}

struct ReactionBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        ReactionBarComponent(style: .small)
    }
}
