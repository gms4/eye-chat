//
//  Teste.swift
//  eye-chat
//
//  Created by alexdamascena on 05/04/23.
//

import SwiftUI
import CoreData

enum Router {
    case FirstScreen
    case SecondScreen
}

enum PointerFinderValue {
    case left
    case mid
    case right
    
    var rawValue: [Bool] {
        switch self {
        case .left:
            return [true, false, false]
        case .mid:
            return [false, true, false]
        case .right:
            return [false, false, true]
        }
    }
}

struct PointerFinder {
    
    private struct Constants {
        static let TOP_RANGE: CGFloat = -200
    }
    
    let center = CGRect(x: UIScreen.midWidth - 25,
                        y: UIScreen.midHeight - 120,
                        width: 50,
                        height: 100)
    
    
    public func didUserMoveAxisY(pointer: CGRect?) -> Bool {
        guard let pointer = pointer else { return false }
        
        if center.minY + center.height < pointer.minY {
            return true
        }
    
        return false
    }
    
    public func didUserMoveAxisX(pointer: CGRect?) -> [Bool] {
        guard let pointer = pointer else { return PointerFinderValue.mid.rawValue }
        
        if center.minX + center.width < pointer.minX {
            return PointerFinderValue.right.rawValue
        }
        
        if pointer.minX < center.minX  - center.width {
            return PointerFinderValue.left.rawValue
        }
        
        return  PointerFinderValue.mid.rawValue
    }
    
    public func didUserDeselectFirstSection(pointer: CGRect?) -> Bool {
        guard let pointer = pointer else { return false }
        
        if pointer.minY < center.minY - center.height {
            return true
        }
        
        return false
    }
    
    public func didUserGoBack(pointer: CGRect?) -> Bool {
        guard let pointer = pointer else { return false }
        
        if pointer.minX < -200 {
            return true
        }
        
        return false
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

typealias Function = (() -> ())

class PointerSelector: ObservableObject {

    @Published var upOrDown = false
    @Published var isFirstSection = true
    @Published var showSection = true

    @Published var axisXFirstSection = [false, false, false]
    @Published var axisXSecondSection = [false, false, false]
    
    @Published var axisXFirstSectionTrigger: [Function]?
    @Published var axisXSecondSectionTrigger: [Function]?
    @Published var upSectionTrigger: Function?
    @Published var downSectionTrigger: Function?
    @Published var goBack: Function?
        
    @Published var shouldUpdate = 0
    
    @Published var content: Content = .onlySections
    
    var pointerFinder = PointerFinder()
    
    init(axisXFirstSectionTrigger: [Function]? = nil,
         axisXSecondSectionTrigger: [Function]? = nil,
         upSectionTrigger: Function? = nil,
         downSectionTrigger: Function? = nil,
         goBack: Function? = nil
    ){
        self.axisXFirstSectionTrigger = axisXFirstSectionTrigger
        self.axisXSecondSectionTrigger = axisXSecondSectionTrigger
        self.upSectionTrigger = upSectionTrigger
        self.downSectionTrigger = downSectionTrigger
        self.goBack = goBack
    }
    
    func setAttributes(_ attributes: AttributesTrigger){
        self.axisXFirstSectionTrigger = attributes.axisXFirstSectionTrigger
        self.axisXSecondSectionTrigger = attributes.axisXSecondSectionTrigger
        self.upSectionTrigger = attributes.upTrigger
        self.downSectionTrigger = attributes.downTrigger
        self.goBack = attributes.goBack
        
    }
    
    func execute(pointerSection: CGRect?){
        guard let pointer = pointerSection else { return }
        
        upOrDown =  pointerFinder.didUserMoveAxisY(pointer: pointer)
        let newAxisX = pointerFinder.didUserMoveAxisX(pointer: pointer)
        
        let isGoBack = pointerFinder.didUserGoBack(pointer: pointer)
        
        if isGoBack {
            goBack?()
            shouldUpdate = -1
        }


        if !showSection && isFirstSection {
            axisXFirstSection = newAxisX
            axisXSecondSection = axisXFirstSection.map { _ in false }

        }

        if !showSection && !isFirstSection {
            axisXSecondSection = newAxisX
            axisXFirstSection = axisXSecondSection.map { _ in false }
        }

        if showSection {
            axisXFirstSection = axisXSecondSection.map { _ in false }
            axisXSecondSection = axisXFirstSection.map { _ in false }
        }

        if !showSection {
            showSection = pointerFinder.didUserDeselectFirstSection(pointer: pointer)
        }
    }
    
    func select(){
        isFirstSection = !upOrDown
        
        if content == .sectionsAndGrid {
            showSection.toggle()
        }
        

        
        if !showSection {
            let axisChoosen = isFirstSection ? axisXFirstSection : axisXSecondSection
            let trigger = isFirstSection ? axisXFirstSectionTrigger : axisXSecondSectionTrigger
            let index = userSelect(axisChoosen)
            trigger?[index]()
        } else {
            
            showSection = false
            
            if content == .sectionsAndGrid {
                return
            }
            
            guard let upTrigger = upSectionTrigger,
                  let downTrigger = downSectionTrigger else { return }

            if isFirstSection { upTrigger() } else { downTrigger() }
        }
    }
    
    private func userSelect(_ option: [Bool]) -> Int {
        let filterIndex = option.enumerated().filter { $1 }.map { $0.0 }
        if filterIndex.count == 0 { return 1 }
        let index = filterIndex[0]
        return index
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
        ContentView(
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
    
        ContentView(
            upTrigger: rightFirstSection,
            downTrigger: leftFirstSection,
            elements: [EyeButtonComponent(style: .createRoom).anyView,
                       EyeButtonComponent(style: .savedRoom).anyView
                      ]
        )
    }
}

struct SecondTeste: View {
    
    var body: some View {
        VStack {
            
        }
        .frame(width: UIScreen.screenWidth - 40, height: 120)
        .background(.black)
    }
}


enum Content {
    case onlySections
    case sectionsAndGrid
}

struct AttributesTrigger {
    
    var axisXFirstSectionTrigger: [Function]?
    var axisXSecondSectionTrigger: [Function]?
    var upTrigger: Function?
    var downTrigger: Function?
    var goBack: Function?
    
}

class AppState: ObservableObject {
    static let shared = AppState()
    
    @Published var gameID = UUID()
}

struct ContentView: View {
    
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

