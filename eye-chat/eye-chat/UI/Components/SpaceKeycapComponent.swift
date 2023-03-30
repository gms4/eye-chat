//
//  SpaceKeycapComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 30/03/23.
//

import SwiftUI

struct SpaceKeycapComponent: View {
    var body: some View {
        Text("")
            .frame(maxWidth: 70.285.su, maxHeight: 23.28.su)
            .background(Color(ColorAsset.SPACE_GRAY))
            .cornerRadius(20)
    }
}

struct SpaceKeycapComponent_Previews: PreviewProvider {
    static var previews: some View {
        SpaceKeycapComponent()
    }
}
