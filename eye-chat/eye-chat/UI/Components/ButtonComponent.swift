//
//  ButtonComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 03/04/23.
//

import SwiftUI

struct ButtonComponent: View {
    let style: ActionStyle
    var body: some View {
        Image(style == .enter ? ImageAsset.GET_IN : ImageAsset.GET_OUT)
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(style: .enter)
    }
}
