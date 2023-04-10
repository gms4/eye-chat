//
//  HomeView.swift
//  eye-chat
//
//  Created by Guilherme Souza on 29/03/23.
//
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
//    @EnvironmentObject var coordinator: ViewCoordinator
    
    let style: EyetrackingStyle
        
    @State var web = ConnectionSingleton.shared
    
    var body: some View {
        VStack (alignment: .center) {
            VStack (alignment: .leading, spacing: 5.14.su) {
                Text(ContentComponent.INITIATE_CHAT)
                    .font(.custom(ContentComponent.M, size: 44))
                EyeButtonComponent(style: .savedRoom)
                EyeButtonComponent(style: .createRoom)
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing) {
            Image(ImageAsset.LOGO_SCREENS)
                .frame(maxWidth: 20.su, maxHeight: 17.14.su)
        }
        .overlay(alignment: .bottomLeading) {
            EyetrackingComponent(style: .activate)
                .frame(maxWidth: 15.71.su, maxHeight: 18.57.su)
            }
        }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(style: .activate)
    }
}
