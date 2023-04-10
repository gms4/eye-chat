//
//  TopicsBoardComponent.swift
//  eye-chat
//
//  Created by egln on 30/03/23.
//

import SwiftUI

struct TopicsBoardComponent: View {
    var body: some View {
        VStack (spacing: 35){
            Grid() {
                GridRow {
                    Grid {
                        FirstTopicsCardComponent(style: .yes, columnName: "Respostas rápidas")
                        TopicsCardComponent(style: .no)
                        TopicsCardComponent(style: .maybe)
                    }
                    Grid {
                        FirstTopicsCardComponent(style: .family, columnName: "Tópicos")
                        TopicsCardComponent(style: .entertainment)
                        TopicsCardComponent(style: .health)
                    }
                    Grid {
                        FirstTopicsCardComponent(style: .day, columnName: "Perguntas")
                        TopicsCardComponent(style: .story)
                        TopicsCardComponent(style: .sorry)
                    }
                }
            }
            HStack (alignment: .center) {
                Circle()
                    .fill(Color(ColorAsset.LIGHT_ORANGE))
                    .frame(width: 14, height: 14)
                Circle()
                    .fill(Color(ColorAsset.PET_ORANGE))
                    .frame(width: 14, height: 14)
                Circle()
                    .fill(Color(ColorAsset.LIGHT_ORANGE))
                    .frame(width: 14, height: 14)
            }
        }
    }
}
        
struct TopicsBoardComponent_Previews: PreviewProvider {
    static var previews: some View {
        TopicsBoardComponent()
    }
}
 
