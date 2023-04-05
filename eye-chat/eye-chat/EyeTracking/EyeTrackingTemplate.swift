//
//  EyeTrackingTemplate.swift
//  eye-chat
//
//  Created by alexdamascena on 05/04/23.
//

import SwiftUI
import CoreData

struct EyeTrackingTemplate: View {
    
    @ObservedObject var eyeViewModel = EyeTrackingViewModel()
    @ObservedObject var selector = PointerSelector()
    
    @State private var viewID: Int = 0
    
    @State var endEyeTracking = 0
    
    private let content: Content
    
    private let elements: [AnyView]
    
    var attributes: AttributesTrigger
    
    @inlinable public init(axisXFirstSectionTrigger: [Function]? = nil,
                           axisXSecondSectionTrigger: [Function]? = nil,
                           upTrigger: Function? = nil,
                           downTrigger: Function? = nil,
                           goBack: Function? = nil,
                           elements: [AnyView]
    ){
        self.attributes = AttributesTrigger(axisXFirstSectionTrigger: axisXFirstSectionTrigger,
                                            axisXSecondSectionTrigger: axisXSecondSectionTrigger,
                                            upTrigger: upTrigger,
                                            downTrigger: downTrigger,
                                            goBack: goBack)
        self.elements = elements
        self.content = elements.count == 6 ? .sectionsAndGrid : .onlySections
    }
    
    
    var body: some View {
        ZStack {
            Color.white
            EyeTrackingView(viewModel: eyeViewModel, endEyeTracking: $endEyeTracking)
                .onChange(of: eyeViewModel.pointer){ value in
                    
                    selector.execute(pointerSection: value)
                    
                    if selector.shouldUpdate == -1 {
                        endEyeTracking = selector.shouldUpdate
                        selector.shouldUpdate = 0
                    }
                }
                .onChange(of: eyeViewModel.selected){ _ in
                    selector.select()
                }
        }
        .onAppear{
            self.selector.setAttributes(self.attributes)
            self.selector.content = content
        }
        .overlay {
            VStack(alignment: .center){
                
                if content == .sectionsAndGrid {
                    HStack {
                        elements[0]
                            .border(selector.axisXFirstSection[0] ?  .green : .black, width: 4)
                        elements[1]
                            .border(selector.axisXFirstSection[1] ?  .green : .black,  width: 4)
                        elements[2]
                            .border(selector.axisXFirstSection[2] ?  .green : .black,  width: 4)
                    }
                    .border(!selector.upOrDown && selector.showSection ? .red : .white, width: 4)
                    
                    HStack {
                        elements[3]
                            .border(selector.axisXSecondSection[0] ? .green : .black, width: 4)
                        elements[4]
                            .border(selector.axisXSecondSection[1] ? .green : .black, width: 4)
                        elements[5]
                            .border(selector.axisXSecondSection[2] ? .green : .black, width: 4)
                    }
                    .border(selector.upOrDown && selector.showSection ? .red : .white, width: 4)
                } else {
                    
                    HStack {
                        elements[0]
                    }
                    .border(!selector.upOrDown && selector.showSection ? .red : .white, width: 4)
                    
                    HStack {
                        elements[1]
                    }
                    .border(selector.upOrDown && selector.showSection ? .red : .white, width: 4)
                }
            }.frame(height: 500)
        }
    }
}

struct Teste: View {
    
    var body: some View {
        VStack {
            Color.black

        }
        .frame(width: UIScreen.screenWidth / 3 - 8, height: 120)
    }
    
    var anyView: AnyView {
        return AnyView(self)
    }
}



struct ThirdView: View {
    
    @EnvironmentObject var coordinator: ViewCordinator
    
    public func goBack(){
        coordinator.pop()
    }
    
    public func teste(){
        print("testinho")
    }
    
    var body: some View {
        EyeTrackingTemplate(
            axisXFirstSectionTrigger: [teste, teste, teste],
            axisXSecondSectionTrigger: [teste, teste, teste],
            goBack: goBack,
            elements: [ KeycapsComponent(style: .aeiou).anyView,
                        KeycapsComponent(style: .aeiou).anyView,
                        KeycapsComponent(style: .aeiou).anyView,
                        KeycapsComponent(style: .aeiou).anyView,
                        KeycapsComponent(style: .aeiou).anyView,
                        KeycapsComponent(style: .aeiou).anyView
                      ]
        )
    }
}

struct HomeView: View {
    
    @EnvironmentObject var coordinator: ViewCordinator
    
    public func leftFirstSection(){
        coordinator.push(view: .create)
    }
    
    public func midFirstSection(){
        coordinator.push(view: .create)
    }
    
    public func rightFirstSection(){
        coordinator.push(view: .create)
    }
    
    public func leftSecondSection(){
        coordinator.push(view: .create)
    }
    
    public func midSecondSection(){
        coordinator.push(view: .create)
    }
    
    public func rightSecondSection(){
        coordinator.push(view: .create)
    }
    
    public func goBack(){
        coordinator.pop()
    }
    
    var body: some View {
    
        EyeTrackingTemplate(
            upTrigger: rightFirstSection,
            downTrigger: leftFirstSection,
            elements: [EyeButtonComponent(style: .createRoom).anyView,
                       EyeButtonComponent(style: .savedRoom).anyView
                      ]
        )
    }
}

