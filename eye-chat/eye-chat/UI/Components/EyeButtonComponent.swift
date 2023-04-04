//
//  ButtonComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 28/03/23.
//

import SwiftUI
extension UIScreen {
    
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct EyeButtonComponent: View {
    
    let style: HomeButtonStyle

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(style == .createRoom ? ContentComponent.TITLE_CREATE : ContentComponent.TITLE_SAVED)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
                Text(style == .createRoom ? ContentComponent.SUBTITLE_CREATE : ContentComponent.SUBTITLE_SAVED)
                    .font(.system(size: 30, weight: .medium))
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
