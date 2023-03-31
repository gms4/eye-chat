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
            Spacer(minLength: 150)
            VStack (alignment: .leading, spacing: 27) {
                    Text("Criar Sala")
                        .font(.system(size: 44, weight: .bold))
                    Text("Nome")
                        .font(.system(size: 40))
                TextField(
                "Digite o nome do seu novo contato",
                text: $newContact
                )
                Spacer()
                
            }
            .frame(maxWidth: 950, maxHeight: 1400)
//            .background(.green)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
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

struct CreateRoom_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoomView(style: .activate)
    }
}
