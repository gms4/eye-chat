//
//  PartialKeyboard.swift
//  eye-chat
//
//  Created by Guilherme Souza on 30/03/23.


import SwiftUI

struct PartialKeyboardComponent: View {

    let style: KeycapStyle
    let chat: ChatStyle
    
    private let textProperties = (
            font: Font.system(size: 120, weight: .medium),
            width:  UIScreen.screenWidth - 102.14.su,
            height: UIScreen.screenHeight - 171.86.su
        )
    
    var body: some View {
        Grid() {
            switch style {
            case .aeiou:
                GridRow {
                    Text(ContentComponent.AEIOU[0])
                    Text(ContentComponent.AEIOU[1])
                    Text(ContentComponent.AEIOU[2])
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
                GridRow {
                    Text(ContentComponent.AEIOU[3])
                    Text(ContentComponent.AEIOU[4])
                    ArrowComponent()
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
            case .srndm:
                GridRow {
                    Text(ContentComponent.SRNDM[0])
                    Text(ContentComponent.SRNDM[1])
                    Text(ContentComponent.SRNDM[2])
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
                GridRow {
                    Text(ContentComponent.SRNDM[3])
                    Text(ContentComponent.SRNDM[4])
                    ArrowComponent()
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
            case .tclpv:
                GridRow {
                    Text(ContentComponent.TCLPV[0])
                    Text(ContentComponent.TCLPV[1])
                    Text(ContentComponent.TCLPV[2])
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
                GridRow {
                    Text(ContentComponent.TCLPV[3])
                    Text(ContentComponent.TCLPV[4])
                    ArrowComponent()
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
            case .ghqbf:
                GridRow {
                    Text(ContentComponent.GHQBF[0])
                    Text(ContentComponent.GHQBF[1])
                    Text(ContentComponent.GHQBF[2])
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
                GridRow {
                    Text(ContentComponent.GHQBF[3])
                    Text(ContentComponent.GHQBF[4])
                    ArrowComponent()
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
            case .zjxkw:
                GridRow {
                    Text(ContentComponent.ZJXKW[0])
                    Text(ContentComponent.ZJXKW[1])
                    Text(ContentComponent.ZJXKW[2])
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
                GridRow {
                    Text(ContentComponent.ZJXKW[3])
                    Text(ContentComponent.ZJXKW[4])
                    ArrowComponent()
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
            case .others:
                GridRow {
                    Text(ContentComponent.OTHERS[0])
                    Text(ContentComponent.OTHERS[1])
                    Text(ContentComponent.OTHERS[2])
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
                GridRow {
                    Text(ContentComponent.OTHERS[3])
                    Text(ContentComponent.OTHERS[4])
                    ArrowComponent()
                }
                .font(textProperties.font)
                .frame(maxWidth: textProperties.width, maxHeight: textProperties.height)
                .background(Color(ColorAsset.LIGHT_GRAY_LETTERS_KEYCAP))
                .cornerRadius(20)
            }
            HStack {
                DeleteKeycapComponent()
                SpaceKeycapComponent()
                if chat == .inside {
                    PrintKeycapComponent()
                } else {
                    CreateRoomComponent()
                }
            }
        }
    }
}

struct PartialKeyboardComponent_Previews: PreviewProvider {
static var previews: some View {
    PartialKeyboardComponent(style: .aeiou, chat: .inside)
    }
}

