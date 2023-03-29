//
//  ReactionsComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 29/03/23.
//

import SwiftUI

enum EmojiStyle: String, CaseIterable, Hashable {
    case smileEmoji = "😊"
    case heartFaceEmoji = "😍"
    case laughEmoji = "😂"
    case cryingEmoji = "😭"
    case judgingEmoji = "😒"
    case angryEmoji = "😡"
    case sadEmoji = "🥺"
    case omgEmoji = "😱"
    case thinkingEmoji = "🤔"
}

struct ReactionsComponent: View {
    
    let style: EmojiStyle
    
    var body: some View {
        ForEach(EmojiStyle.allCases, id:\.self){ value in
            if value == style {
                Text(value.rawValue)
                    .font(.system(size: 110))
                    .frame(maxWidth: 310.22, maxHeight: 163)
                    .background(Color("light-gray"))
                    .cornerRadius(20)
            }
        }
    }
}

struct ReactionsComponent_Previews: PreviewProvider {
    static var previews: some View {
        ReactionsComponent(style: .smileEmoji)
    }
}
