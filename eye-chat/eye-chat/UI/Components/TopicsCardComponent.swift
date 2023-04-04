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
}

struct FirstTopicsCardComponent: View {
    
    let style: TopicsCardStyle
    
    let columnName: String
    
    var body: some View {
        ForEach(TopicsCardStyle.allCases, id:\.self){ value in
            if value == style {
                VStack (spacing: 0){
                    
                    
                    Text(columnName)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 310.22, maxHeight: 35)
                        .background(.blue)

                        //.background(Color("light-gray"))
                        .cornerRadius(20)
                        .foregroundColor(.white)
                    
                    Text(value.rawValue)
                        .font(.system(size: 32))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 310.22, maxHeight: 128)
                        .background(Color("light-gray"))
                        .cornerRadius(20)
                }.frame(maxWidth: 310.22, maxHeight: 163)
            }
        }
    }
    
    struct TopicCardComponent_Previews: PreviewProvider {
        static var previews: some View {
            FirstTopicsCardComponent(style: .yes, columnName: "Respostas rápidas")
        }
    }
}

