//
//  ChatScreenView.swift
//  eye-chat
//
//  Created by Guilherme Souza on 04/04/23.
//  
//

import SwiftUI

struct ChatScreenView: View {
    
    let cameraSizeStyle: CameraSizeStyle
    let keycapStyle: KeycapStyle
    var body: some View {
        VStack {
            CameraDisplayComponent(style: .small)
            ReactionBarComponent(style: .small)
            Spacer()
//            PartialKeyboardComponent(style: .aeiou, chat: .inside)
            FullKeyboardComponent(chat: .inside)
//            TopicsBoardComponent()
//            KeyboardReactionsComponent()
            Spacer()
            HStack {
                EyetrackingComponent(style: .activate)
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 70, trailing: 40))
        }
    }
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreenView(cameraSizeStyle: .small, keycapStyle: .aeiou)
            .ignoresSafeArea()
    }
}
