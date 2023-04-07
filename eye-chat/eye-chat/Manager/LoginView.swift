//
//  LoginView.swift
//  eye-chat
//
//  Created by Guilherme Souza on 04/04/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    var body: some View {
        VStack (alignment: .leading, spacing: 830) {
            Title()
            
            switch authManager.biometryType {
            case .faceID:
                PrimaryButton(image: "faceid")
                    .onTapGesture {
                        Task.init {
                            await authManager.authenticateWithBiometrics()
                        }
                    }
            default:
                PrimaryButton(image: "person.fill")
                    .onTapGesture {
                        Task.init {
                            await authManager.authenticateWithBiometrics()
                        }
                    }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 76, bottom: 0, trailing: 363))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image(ImageAsset.SIGN_UP_SCREEN))
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthManager())
    }
}
