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
    
    var spacing: CGFloat?
    
    @inlinable public init(axisXFirstSectionTrigger: [Function]? = nil,
                           axisXSecondSectionTrigger: [Function]? = nil,
                           axisXThirdSectionTrigger: [Function]? = nil,
                           upTrigger: Function? = nil,
                           downTrigger: Function? = nil,
                           goBack: Function? = nil,
                           spacing: CGFloat? = nil,
                           elements: [AnyView]
                 
    ){
        self.attributes = AttributesTrigger(axisXFirstSectionTrigger: axisXFirstSectionTrigger,
                                            axisXSecondSectionTrigger: axisXSecondSectionTrigger,
                                            axisXThirdSectionTrigger: axisXThirdSectionTrigger,
                                            upTrigger: upTrigger,
                                            downTrigger: downTrigger,
                                            goBack: goBack)
        self.elements = elements
        self.spacing = spacing
        self.content = elements.count == 9 ? .sectionsAndGrid : .onlySections
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
                    print("tá funcionando")
                    selector.select()
                }
        }
        .onAppear{
            self.selector.content = content
            self.selector.setAttributes(self.attributes)
        }
        .overlay {
            VStack(alignment: .center, spacing: self.spacing ?? 16 ){
//                dasdkjakldjkaldjald
                if content == .sectionsAndGrid {
                    HStack {
                        elements[0]
                            .border(selector.axisXFirstSection[0] ?  .green : .black, width: 4)
                        elements[1]
                            .border(selector.axisXFirstSection[1] ?  .green : .black,  width: 4)
                        elements[2]
                            .border(selector.axisXFirstSection[2] ?  .green : .black,  width: 4)
                    }
                    .border(selector.axisYSection?[0] ?? false && selector.showSection ? .red : .white, width: 4)
                    
                    HStack {
                        elements[3]
                            .border(selector.axisXSecondSection[0] ? .green : .black, width: 4)
                        elements[4]
                            .border(selector.axisXSecondSection[1] ? .green : .black, width: 4)
                        elements[5]
                            .border(selector.axisXSecondSection[2] ? .green : .black, width: 4)
                    }
                    .border(selector.axisYSection?[1] ?? false && selector.showSection ? .red : .white, width: 4)
                    
                    
                    HStack {
                        elements[6]
                            .border(selector.axisXThirdSection[0] ? .green : .black, width: 4)
                        elements[7]
                            .border(selector.axisXThirdSection[1] ? .green : .black, width: 4)
                        elements[8]
                            .border(selector.axisXThirdSection[2] ? .green : .black, width: 4)
                        
                    }.border(selector.axisYSection?[2] ?? false && selector.showSection ? .red : .white, width: 4)
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
            }
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
    
    public func teste1(){
        print("testinho 1 ")
    }
    
    public func teste2(){
        print("testinho 2 ")
    }
    
    public func teste3(){
        print("testinho 3")
    }
    
    public func teste4(){
        print("testinho 4")
    }
    
    public func teste5(){
        print("testinho 5")
    }
    
    public func teste6(){
        print("testinho 6")
    }
    
    public func teste7(){
        print("testinho 7")
    }
    
    public func teste8(){
        print("testinho 8")
    }
    
    public func teste9(){
        print("testinho 9")
    }
    
    
    var body: some View {
        EyeTrackingTemplate(
            axisXFirstSectionTrigger: [teste1, teste2, teste3],
            axisXSecondSectionTrigger: [teste4, teste5, teste6],
            axisXThirdSectionTrigger: [teste7, teste8, teste9],
            goBack: goBack,
            elements: [ Teste().anyView,
                        Teste().anyView,
                        Teste().anyView,
                        Teste().anyView,
                        Teste().anyView,
                        Teste().anyView,
                        Teste().anyView,
                        Teste().anyView,
                        Teste().anyView,
                      ]
        )
    }
}

//struct HomeView: View {
//    
//    @EnvironmentObject var coordinator: ViewCordinator
//    
//    public func leftFirstSection(){
//        coordinator.push(view: .create)
//    }
//    
//    public func midFirstSection(){
//        coordinator.push(view: .create)
//    }
//    
//    public func rightFirstSection(){
//        coordinator.push(view: .create)
//    }
//    
//    public func leftSecondSection(){
//        coordinator.push(view: .create)
//    }
//    
//    public func midSecondSection(){
//        coordinator.push(view: .create)
//    }
//    
//    public func rightSecondSection(){
//        coordinator.push(view: .create)
//    }
//    
//    public func goBack(){
//        coordinator.pop()
//    }
//    
//    var body: some View {
//    
//        EyeTrackingTemplate(
//            upTrigger: rightFirstSection,
//            downTrigger: leftFirstSection,
//            elements: [EyeButtonComponent(style: .createRoom).anyView,
//                       EyeButtonComponent(style: .savedRoom).anyView
//                      ]
//        )
//    }
//}

