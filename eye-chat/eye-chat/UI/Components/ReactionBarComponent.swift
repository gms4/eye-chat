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
        Rectangle ()
            .fill(Color(ColorAsset.REACTION_BAR_COLOR))
            .frame(maxWidth: .infinity, maxHeight: style == .small ? 156.35 : 275)
    }
}

struct ReactionBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        ReactionBarComponent(style: .small)
    }
}
