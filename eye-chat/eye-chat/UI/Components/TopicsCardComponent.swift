//
//  TopicCardComponent.swift
//  eye-chat
//
//  Created by egln on 30/03/23.
//
//
import SwiftUI

struct TopicsCardComponent: View {
    
    var anyView: AnyView {
        return AnyView(self)
    }
    
    let style: TopicsCardStyle
    
    var body: some View {
        ForEach(TopicsCardStyle.allCases, id:\.self){ value in
            if value == style {
                Text(value.rawValue)
                    .font(.custom(ContentComponent.SB, size: 32))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 310.22, maxHeight: 189)
                    .background(Color("light-gray"))
                    .cornerRadius(20)
            }
        }
    }
}

struct FirstTopicsCardComponent: View {
    
    let style: TopicsCardStyle
    
    let columnName: String
    
    var body: some View {
        ForEach(TopicsCardStyle.allCases, id:\.self){ value in
            if value == style {
                VStack (spacing: 0) {
                    Text(columnName)
                        .font(.custom(ContentComponent.SB, size: 24))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 310.22, maxHeight: 44)
                        .background(
                            RoundedCornersShape(corners: [.topLeft, .topRight], radius: 15)
                                        .fill(Color("blue-keycap"))
                                )
                        .foregroundColor(.white)
                    
                    Text(value.rawValue)
                        .font(.custom(ContentComponent.SB, size: 32))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 310.22, maxHeight: 145)
                        .background(
                            RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 15)
                                        .fill(Color("light-gray"))
                                )
                }.frame(maxWidth: 310.22, maxHeight: 189)
            }
        }
    }
    
    struct TopicCardComponent_Previews: PreviewProvider {
        static var previews: some View {
            FirstTopicsCardComponent(style: .story, columnName: "Respostas rápidas")
        }
    }
}

