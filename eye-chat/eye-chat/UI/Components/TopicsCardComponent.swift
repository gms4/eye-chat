//
//  TopicCardComponent.swift
//  eye-chat
//
//  Created by egln on 30/03/23.
//
//
import SwiftUI

enum TopicsCardStyle: String, CaseIterable, Hashable {
    case yes = "SIM"
    case no = "NÃO"
    case maybe = "TALVEZ"
    case family = "Família"
    case entertainment = "Entretenimento"
    case health = "Saúde"
    case story = "Me conta uma \n história?"
    case day = "Como foi o \n seu dia?"
    case sorry = "Você me desculpa?"
}


struct TopicsCardComponent: View {
    
    let style: TopicsCardStyle
    
    var body: some View {
        ForEach(TopicsCardStyle.allCases, id:\.self){ value in
            if value == style {
                Text(value.rawValue)
                    .font(.system(size: 32))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 310.22, maxHeight: 163)
                    .background(Color("light-gray"))
                    .cornerRadius(20)
            }
        }
    }
    
    struct TopicCardComponent_Previews: PreviewProvider {
        static var previews: some View {
            TopicsCardComponent(style: .maybe)
        }
    }
}
