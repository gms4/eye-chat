//
//  KeycapsComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 30/03/23.
//

import SwiftUI

struct KeycapsComponent: View {
    
    let style: KeycapStyle
    
    var anyView: AnyView {
        return AnyView(self)
    }
    
    var body: some View {
        ForEach(KeycapStyle.allCases, id:\.self){ value in
            if value == style {
                Text(value.rawValue)
                    .font(.system(size: 48, weight: .medium))
                    .frame(maxWidth: 44.14.su, maxHeight: 23.28.su)
                    .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                    .cornerRadius(20)
            }
        }
    }
}

struct KeycapsComponent_Previews: PreviewProvider {
    static var previews: some View {
        KeycapsComponent(style: .aeiou)
    }
}
