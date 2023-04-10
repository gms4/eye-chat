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
        .frame(maxWidth: .infinity, maxHeight: style == .small ? 164 : 275)
        .scaledToFill()
        .background(Color(ColorAsset.BLUE_TEXTFIELD))
    }
}

struct ReactionBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        ReactionBarComponent(style: .small)
    }
}
