//
//  FaceIDAuthView.swift
//  eye-chat
//
//  Created by Guilherme Souza on 04/04/23.
//  
//

import SwiftUI

struct FaceIDAuthView: View {
    
    var body: some View {
        NavigationStack {
                VStack (alignment: .leading, spacing: 830) {
                    Title()
                    NavigationLink(destination: HomeView(style: .activate)) {
                        PrimaryButton(image: "faceid")
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 76, bottom: 0, trailing: 363))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image(ImageAsset.SIGN_UP_SCREEN))
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct FaceIDAuth_Previews: PreviewProvider {
    static var previews: some View {
        FaceIDAuthView()
    }
}
