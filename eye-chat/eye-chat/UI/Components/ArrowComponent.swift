//
//  ArrowComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 30/03/23.
//

import SwiftUI

struct ArrowComponent: View {
    var body: some View {
        Image(systemName: "arrow.uturn.left")
            .font(.system(size: 48, weight: .medium))
            .frame(maxWidth: 44.14.su, maxHeight: 23.28.su)
            .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
            .cornerRadius(20)
    }
}

struct ArrowComponent_Previews: PreviewProvider {
    static var previews: some View {
        ArrowComponent()
    }
}
