//
//  EnumExample.swift
//  eye-chat
//
//  Created by alexdamascena on 28/03/23.
//

import Foundation

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
