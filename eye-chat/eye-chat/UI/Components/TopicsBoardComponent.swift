//
//  TopicsBoardComponent.swift
//  eye-chat
//
//  Created by egln on 30/03/23.
//

import SwiftUI

struct TopicsBoardComponent: View {
    var body: some View {
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
    }
}
        
struct TopicsBoardComponent_Previews: PreviewProvider {
    static var previews: some View {
        TopicsBoardComponent()
    }
}
 
