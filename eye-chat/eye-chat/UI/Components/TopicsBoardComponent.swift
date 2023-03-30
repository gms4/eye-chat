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
                    ZStack{
                        Text("Respostas Rápidas")
                            .padding()
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(20)
                    } .frame(maxWidth: 310.22, maxHeight: 35)
                        .background(Color.blue)
                        .cornerRadius(120)

                    TopicsCardComponent(style: .no)
                    TopicsCardComponent(style: .yes)
                    TopicsCardComponent(style: .maybe)
                }
                
                Grid{
                    Text("Tópicos")
                        .font(.system(size: 18))

                    TopicsCardComponent(style: .family)
                    TopicsCardComponent(style: .entertainment)
                    TopicsCardComponent(style: .health)
                    
                }
                Grid{
                    Text("Perguntas")

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
 
