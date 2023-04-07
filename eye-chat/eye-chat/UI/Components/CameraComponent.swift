//
//  CameraComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 03/04/23.
//

import SwiftUI

struct CameraComponent: View {
    let style: CameraStyle
    var body: some View {
        Image(style == .on ? ImageAsset.DEACTIVATE_CAMERA : ImageAsset.ACTIVATE_CAMERA)
    }
}

struct CameraComponent_Previews: PreviewProvider {
    static var previews: some View {
        CameraComponent(style: .on)
    }
}
