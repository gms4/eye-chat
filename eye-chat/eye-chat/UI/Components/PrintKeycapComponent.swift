//
//  PrintKeycapComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 30/03/23.
//

import SwiftUI

struct PrintKeycapComponent: View {
    var body: some View {
        Text(ContentComponent.PRINT)
            .font(.system(size: 40, weight: .bold))
            .frame(maxWidth: 31.14.su, maxHeight: 23.28.su)
            .background(Color(ColorAsset.LIGHT_GRAY_DELETE_KEYCAP))
            .cornerRadius(20)
    }
}

struct PrintKeycapComponent_Previews: PreviewProvider {
    static var previews: some View {
        PrintKeycapComponent()
    }
}
