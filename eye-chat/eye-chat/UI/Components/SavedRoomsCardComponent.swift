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
    
    var body: some View {
                Text(cardTitle)
                    .font(.system(size: 36, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 310.22, height: 163)
                    .background(Color(cardColor))
                    .cornerRadius(20)
            }
        }

struct SavedRoomsComponent_Previews: PreviewProvider {
    static var previews: some View {
        SavedRoomsCardComponent(cardTitle: "tokopext", cardColor: "blue-keycap")
    }
}
