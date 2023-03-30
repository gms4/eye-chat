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
            GridRow{
                Grid{
                    TopicsCardComponent(style: .no)
                    TopicsCardComponent(style: .yes)
                    TopicsCardComponent(style: .maybe)
                }
                
                Grid{
                    TopicsCardComponent(style: .family)
                    TopicsCardComponent(style: .entertainment)
                    TopicsCardComponent(style: .health)
                    
                }
                Grid{
                    TopicsCardComponent(style: .story)
                    TopicsCardComponent(style: .day)
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
