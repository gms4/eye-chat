//
//  FaceIDAuthView.swift
//  eye-chat
//
//  Created by Guilherme Souza on 04/04/23.
//  
//

import SwiftUI

struct FaceIDAuthView: View {
    @StateObject var authManager = AuthManager()
       
    var body: some View {
        NavigationStack {
            if authManager.isAuthenticated {
                VStack (spacing: 40) {
                    Title()
                    Text("Welcome in! You're now authenticated.")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
            } else {
                LoginView()
                    .environmentObject(AuthManager())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $authManager.showAlert) {
            Alert(title: Text("Error"), message: Text(authManager.errorDescription ?? "Error trying to login with credentials, please try again"), dismissButton: .default(Text("OK")))
        }
    }

}

struct FaceIDAuth_Previews: PreviewProvider {
    static var previews: some View {
        FaceIDAuthView()
    }
}