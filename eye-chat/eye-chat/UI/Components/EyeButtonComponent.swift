//
//  ButtonComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 28/03/23.
//

import SwiftUI

struct EyeButtonComponent: View {
    
    let style: HomeButtonStyle
    
    var anyView: AnyView {
        return AnyView(self)
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(style == .createRoom ? ContentComponent.TITLE_CREATE : ContentComponent.TITLE_SAVED)
                    .font(.custom(ContentComponent.B, size: 44))
                    .foregroundColor(.white)
                Spacer()
                Text(style == .createRoom ? ContentComponent.SUBTITLE_CREATE : ContentComponent.SUBTITLE_SAVED)
                    .font(.custom(ContentComponent.M, size: 34))
                    .foregroundColor(.white)
                    .padding(.vertical, 13)
            }
            Spacer()
            if style == .createRoom {
                VStack(alignment: .trailing) {
                    Spacer()
                }
                .frame(maxHeight: .infinity)
            }
 
        }
        .frame(width: UIScreen.screenWidth-20.su, height: 55.5.su, alignment: .topLeading)
        .padding(EdgeInsets(top: 35, leading: 40, bottom: 35, trailing: 35))
        .background(
            Image(style == .createRoom ? ImageAsset.BLUE_BACKGROUND : ImageAsset.ORANGE_BACKGROUND)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .cornerRadius(20)
        
        
        
        
        
    }
}

struct EyeButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        EyeButtonComponent(style: .savedRoom)
    }
}
