//
//  CameraDisplayComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 29/03/23.
//

import SwiftUI

struct CameraDisplayComponent: View {
    let style: CameraSizeStyle
    var body: some View {
            HStack {
                Image(ImageAsset.VIDEO_FRIEND)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .bottomTrailing) {
                        Image(ImageAsset.VIDEO_YOURS)
                            .padding(3.85.su)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: style == .small ? 444 : 856)
        }
    }

struct CameraDisplayComponent_Previews: PreviewProvider {
    static var previews: some View {
        CameraDisplayComponent(style: .big)
            .ignoresSafeArea()
    }
}
