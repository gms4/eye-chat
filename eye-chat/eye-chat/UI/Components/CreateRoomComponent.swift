//
//  CreateRoomComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 30/03/23.
//

import SwiftUI

struct CreateRoomComponent: View {
    var body: some View {
        Text(ContentComponent.CREATE)
            .font(.system(size: 40, weight: .bold))
            .foregroundColor(.white)
            .frame(maxWidth: 31.14.su, maxHeight: 23.28.su)
            .background(Color(ColorAsset.BLUE_KEYCAP))
            .cornerRadius(20)
    }
}

struct CreateRoomComponent_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoomComponent()
    }
}
