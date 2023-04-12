//
//  KeyboardComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 29/03/23.
//

import SwiftUI

struct Teste2: View {
    
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

struct KeyboardReactionsComponent: View {
    
    @EnvironmentObject var coordinator: ViewCordinator
    
    @State var elements: [AnyView] = [ReactionsComponent(style: .smileEmoji).anyView,
                                      ReactionsComponent(style: .heartFaceEmoji).anyView,
                                      ReactionsComponent(style: .laughEmoji).anyView,
                                      ReactionsComponent(style: .cryingEmoji).anyView,
                                      ReactionsComponent(style: .judgingEmoji).anyView,
                                      ReactionsComponent(style: .angryEmoji).anyView,
                                      ReactionsComponent(style: .sadEmoji).anyView,
                                      ReactionsComponent(style: .omgEmoji).anyView,
                                      ReactionsComponent(style: .thinkingEmoji).anyView]
    
    public func goBack(){
        coordinator.pop()
    }
    
    public func grid0 () {
        elements[0] = ReactionsComponent(style: .smileEmoji).anyView
    }
    public func grid1 () {
        elements[1] = ReactionsComponent(style: .heartFaceEmoji).anyView
    }
    public func grid2 () {
        elements[2] = ReactionsComponent(style: .laughEmoji).anyView
    }
    public func grid3 () {
        elements[3] = ReactionsComponent(style: .cryingEmoji).anyView
    }
    public func grid4 () {
        elements[4] = ReactionsComponent(style: .judgingEmoji).anyView
    }
    public func grid5 () {
        elements[5] = ReactionsComponent(style: .angryEmoji).anyView
    }
    public func grid6 () {
        elements[6] = ReactionsComponent(style: .sadEmoji).anyView
    }
    public func grid7 () {
        elements[7] = ReactionsComponent(style: .omgEmoji).anyView
    }
    public func grid8 () {
        elements[8] = ReactionsComponent(style: .thinkingEmoji).anyView
    }
    
    var body: some View {
        VStack {
            Spacer(minLength: 280)
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
                    .fill(Color(ColorAsset.PET_ORANGE))
                    .frame(width: 14, height: 14)
                Circle()
                    .fill(Color(ColorAsset.LIGHT_ORANGE))
                    .frame(width: 14, height: 14)
                Circle()
                    .fill(Color(ColorAsset.LIGHT_ORANGE))
                    .frame(width: 14, height: 14)
            }
            Spacer(minLength: 250)
        }
    }
}

struct KeyboardReactionsComponent_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardReactionsComponent()
    }
}
