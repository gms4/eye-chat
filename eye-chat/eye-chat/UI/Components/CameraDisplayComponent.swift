//
//  CameraDisplayComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 29/03/23.
//

import SwiftUI

enum CameraStyle {
    case big
    case small
}

struct CameraDisplayComponent: View {
    var body: some View {
            HStack {
                Image(ImageAsset.VIDEO_FRIEND)
                    .frame(maxWidth: .infinity, maxHeight: 63.4.su)
                    .overlay(alignment: .bottomTrailing) {
                        Image(ImageAsset.VIDEO_YOURS)
                            .padding(3.85.su)
                    }
            }
            .frame(maxWidth: .infinity)
        }
    }

struct CameraDisplayComponent_Previews: PreviewProvider {
    static var previews: some View {
        CameraDisplayComponent()
            .ignoresSafeArea()
    }
}
