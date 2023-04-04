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
        VStack (spacing: 40) {
            Title()
            
            switch authManager.biometryType {
            case .faceID:
                PrimaryButton(image: "faceid", text: "Login with FaceID")
                    .onTapGesture {
                        Task.init {
                            await authManager.authenticateWithBiometrics()
                        }
                    }
            default:
                PrimaryButton(image: "person.fill", text: "Login with your credentials")
                    .onTapGesture {
                        Task.init {
                            await authManager.authenticateWithBiometrics()
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthManager())
    }
}
