//
//  TopicsBoardComponent.swift
//  eye-chat
//
//  Created by egln on 30/03/23.
//

import SwiftUI

struct Teste1: View {
    
    var body: some View {
        VStack {
            Color(ColorAsset.LIGHT_GRAY)
        }
        .frame(width: 309, height: 145)
    }
    
    var anyView: AnyView {
        return AnyView(self)
    }
}

struct TopicsBoardComponent: View {
    
    @EnvironmentObject var coordinator: ViewCordinator
    
    @State var elements: [AnyView] = [TopicsCardComponent(style: .plans).anyView,
                                      TopicsCardComponent(style: .yes).anyView,
                                      TopicsCardComponent(style: .yes).anyView,
                                      TopicsCardComponent(style: .yes).anyView,
                                      TopicsCardComponent(style: .yes).anyView,
                                      TopicsCardComponent(style: .yes).anyView,
                                      TopicsCardComponent(style: .yes).anyView,
                                      TopicsCardComponent(style: .yes).anyView,
                                      TopicsCardComponent(style: .yes).anyView]
    
    public func goBack(){
        coordinator.pop()
        
        // o que eu quero?
        // componente de forma específica
        // o que eu tenho?
        //
        // o que eu posso fazer?
    }
    
    
    public func grid0 () {
        elements[0] = TopicsCardComponent(style: .yes).anyView
    }
    public func grid1 () {
        elements[1] = TopicsCardComponent(style: .family).anyView
    }
    public func grid2 () {
        elements[2] = TopicsCardComponent(style: .how_you_doing).anyView
    }
    public func grid3 () {
        elements[3] = TopicsCardComponent(style: .no).anyView
    }
    public func grid4 () {
        elements[4] = TopicsCardComponent(style: .entertainment).anyView
    }
    public func grid5 () {
        elements[5] = TopicsCardComponent(style: .story).anyView
    }
    public func grid6 () {
        elements[6] = TopicsCardComponent(style: .maybe).anyView
    }
    public func grid7 () {
        elements[7] = TopicsCardComponent(style: .health).anyView
    }
    public func grid8 () {
        elements[8] = TopicsCardComponent(style: .plans).anyView
    }
    
    
    var body: some View {
        VStack (spacing: 0) {
            HStack (spacing: 10) {
                Text("Respostas rápidas")
                    .font(.custom(ContentComponent.SB, size: 24))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 310.22, maxHeight: 44)
                    .background(
                        RoundedCornersShape(corners: [.topLeft, .topRight], radius: 15)
                            .fill(Color(ColorAsset.BLUE_KEYCAP))
                    )
                    .foregroundColor(.white)
                Text("Tópicos")
                    .font(.custom(ContentComponent.SB, size: 24))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 310.22, maxHeight: 44)
                    .background(
                        RoundedCornersShape(corners: [.topLeft, .topRight], radius: 15)
                            .fill(Color(ColorAsset.BLUE_KEYCAP))
                    )
                    .foregroundColor(.white)
                Text("Perguntas")
                    .font(.custom(ContentComponent.SB, size: 24))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 310.22, maxHeight: 44)
                    .background(
                        RoundedCornersShape(corners: [.topLeft, .topRight], radius: 15)
                            .fill(Color(ColorAsset.BLUE_KEYCAP))
                    )
                    .foregroundColor(.white)
            }
            //            Grid() {
            //                GridRow {
            //                    Grid {
            //                        FirstTopicsCardComponent(style: .yes, columnName: "Respostas rápidas")
            //                        TopicsCardComponent(style: .no)
            //                        TopicsCardComponent(style: .maybe)
            //                    }
            //                    Grid {
            //                        FirstTopicsCardComponent(style: .family, columnName: "Tópicos")
            //                        TopicsCardComponent(style: .entertainment)
            //                        TopicsCardComponent(style: .health)
            //                    }
            //                    Grid {
            //                        FirstTopicsCardComponent(style: .day, columnName: "Perguntas")
            //                        TopicsCardComponent(style: .story)
            //                        TopicsCardComponent(style: .sorry)
            //                    }
            //                }
            //            }
            EyeTrackingTemplate(
                axisXFirstSectionTrigger: [grid0, grid1, grid2],
                axisXSecondSectionTrigger: [grid3, grid4, grid5],
                axisXThirdSectionTrigger: [grid6, grid7, grid8],
                goBack: goBack,
                style: StyleCard(spacing: 10, borderColor: .yellow),
                elements: elements
            )
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

