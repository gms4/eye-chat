//
//  FullKeyboardComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 30/03/23.
//

import SwiftUI

struct Teste3: View {
    
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

struct FullKeyboardComponent: View {
    
    @EnvironmentObject var coordinator: ViewCordinator
    
    @State var elements: [AnyView] = [
                                        KeycapsComponent(style: .aeiou).anyView,
                                        KeycapsComponent(style: .srndm).anyView,
                                        KeycapsComponent(style: .tclpv).anyView,
                                        KeycapsComponent(style: .ghqbf).anyView,
                                        KeycapsComponent(style: .zjxkw).anyView,
                                        KeycapsComponent(style: .others).anyView,
                                        DeleteKeycapComponent().anyView,
                                        SpaceKeycapComponent().anyView,
                                        CreateRoomComponent().anyView
                                    ]
    
    public func goBack(){
        coordinator.pop()
    }
    
    public func grid0 () {
        elements[0] = KeycapsComponent(style: .aeiou).anyView
    }
    public func grid1 () {
        elements[1] = KeycapsComponent(style: .srndm).anyView
    }
    public func grid2 () {
        elements[2] = KeycapsComponent(style: .tclpv).anyView
    }
    public func grid3 () {
        elements[3] = KeycapsComponent(style: .ghqbf).anyView
    }
    public func grid4 () {
        elements[4] = KeycapsComponent(style: .zjxkw).anyView
    }
    public func grid5 () {
        elements[5] = KeycapsComponent(style: .others).anyView
    }
    public func grid6 () {
        elements[6] = DeleteKeycapComponent().anyView
    }
    public func grid7 () {
        elements[7] = SpaceKeycapComponent().anyView
    }
    public func grid8 () {
        elements[8] = CreateRoomComponent().anyView
    }
    
    
    let chat: ChatStyle
    
    var body: some View {
        VStack {
            Spacer(minLength: 280)
            EyeTrackingTemplate(
                axisXFirstSectionTrigger: [grid0, grid1, grid2],
                axisXSecondSectionTrigger: [grid3, grid4, grid5],
                axisXThirdSectionTrigger: [grid6, grid7, grid8],
                goBack: goBack,
                style: StyleCard(spacing: 0, borderColor: .yellow),
                elements: elements
            )
            if chat == .inside {
                HStack (alignment: .center) {
                    Circle()
                        .fill(Color(ColorAsset.LIGHT_ORANGE))
                        .frame(width: 14, height: 14)
                    Circle()
                        .fill(Color(ColorAsset.LIGHT_ORANGE))
                        .frame(width: 14, height: 14)
                    Circle()
                        .fill(Color(ColorAsset.PET_ORANGE))
                        .frame(width: 14, height: 14)
                }
                Spacer(minLength: 250)
            }
        }
    }
}

struct FullKeyboardComponent_Previews: PreviewProvider {
    static var previews: some View {
        FullKeyboardComponent(chat: .outside)
    }
}
