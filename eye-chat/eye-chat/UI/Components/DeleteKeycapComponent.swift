//
//  DeleteKeycapComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 30/03/23.
//

import SwiftUI

struct DeleteKeycapComponent: View {
    
    var anyView: AnyView {
        return AnyView(self)
    }
    
    var body: some View {
        Image(systemName: ContentComponent.DELETE)
            .font(.system(size: 45))
            .frame(maxWidth: 31.14.su, maxHeight: 23.28.su)
            .background(Color(ColorAsset.LIGHT_GRAY_DELETE_KEYCAP))
            .cornerRadius(20)
    }
}

struct DeleteKeycapComponent_Previews: PreviewProvider {
    static var previews: some View {
        DeleteKeycapComponent()
    }
}
