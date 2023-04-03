//
//  HomeView.swift
//  eye-chat
//
//  Created by Guilherme Souza on 29/03/23.
//
//

import SwiftUI


enum EyetrackingStyle {
    
    case activate
    case deactivate
}
struct HomeView: View {

    @ObservedObject private var viewModel = HomeViewModel()
    let style: EyetrackingStyle
       
    var body: some View {
        VStack (alignment: .center) {
            VStack (alignment: .leading, spacing: 5.14.su) {
                Text("Inicie uma conversa com EyeChat!")
                    .font(.system(size: 40))
                    .fontWeight(.medium)
                EyeButtonComponent(style: .savedRoom)
                EyeButtonComponent(style: .createRoom)
//                Image(style == .activate ? ImageAsset.DEACTIVATE_EYETRACKING : ImageAsset.ACTIVATE_EYETRACKING)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing) {
            Image("logo-screens")
                .frame(maxWidth: 20.su, maxHeight: 17.14.su)
        }
        .overlay(alignment: .bottomLeading) {
            Image(style == .activate ? ImageAsset.DEACTIVATE_EYETRACKING : ImageAsset.ACTIVATE_EYETRACKING)
                .frame(maxWidth: 110, maxHeight: 130)
            }
        }
    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(style: .activate)
    }
}
