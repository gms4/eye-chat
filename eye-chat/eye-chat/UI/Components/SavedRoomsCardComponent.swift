//
//  SavedRoomsComponent.swift
//  eye-chat
//
//  Created by egln on 04/04/23.
//
import SwiftUI


struct SavedRoomsCardComponent: View {
    
    var cardTitle: String
    var cardColor: String
//    
    var anyView: AnyView {
        return AnyView(self)
    }
    
    var body: some View {
                Text(cardTitle)
                    .font(.custom(ContentComponent.B, size: 36))
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.screenWidth/3 - 24, height: 135)
                    .background(Color(cardColor))
                    .cornerRadius(20)
            }
        }

struct SavedRoomsComponent_Previews: PreviewProvider {
    static var previews: some View {
        SavedRoomsCardComponent(cardTitle: "tokopext", cardColor: "blue-textfield")
    }
}
