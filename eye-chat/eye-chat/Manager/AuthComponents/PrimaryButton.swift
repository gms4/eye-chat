//
//  PrimaryButton.swift
//  eye-chat
//
//  Created by Guilherme Souza on 04/04/23.
//

import SwiftUI

struct PrimaryButton: View {
    var image: String?
    var showImage = true
    
    var body: some View {
        HStack {
            if showImage {
                Image(ImageAsset.LOG_IN_WITH_FACEID)
            }
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(image: "faceid")
    }
}
