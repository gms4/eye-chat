//
//  CreateRoomView.swift
//  eye-chat
//
//  Created by Guilherme Souza on 31/03/23.
//  
//

import SwiftUI

struct CreateRoomView: View {

    @ObservedObject private var viewModel = CreateRoomViewModel()
    let style: EyetrackingStyle
    @State var newContact: String = ""
       
    var body: some View {
        VStack (alignment: .center) {
            Spacer(minLength: 21.42.su)
            VStack (alignment: .leading, spacing: 27) {
                Text(ContentComponent.CREATE_ROOM)
                    .font(.custom(ContentComponent.B, size: 48))
                Text(ContentComponent.USERNAME_TAG)
                        .font(.custom(ContentComponent.M, size: 44))
                TextField(
                    ContentComponent.TEXTFIELD_PLACEHOLDER,
                text: $newContact
                )
                .background(Color(ColorAsset.BLUE_TEXTFIELD))
                .cornerRadius(10)
                .foregroundColor(Color.black)
                .font(.custom(ContentComponent.M, size: 48))
                Spacer()
            }
            .frame(maxWidth: 135.7.su)
            FullKeyboardComponent(chat: .outside)
            Spacer(minLength: 20.su)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing) {
            Image(ImageAsset.LOGO_SCREENS)
                .frame(maxWidth: 20.su, maxHeight: 17.14.su)
        }
        .overlay(alignment: .bottomLeading) {
            EyetrackingComponent(style: .activate)
                .frame(maxWidth: 110, maxHeight: 130)
            }
    }

}

struct CreateRoom_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoomView(style: .activate)
    }
}
