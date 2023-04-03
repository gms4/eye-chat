//
//  PointerSelector.swift
//  eye-chat
//
//  Created by alexdamascena on 03/04/23.
//

import Foundation

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
        
    @Published var shouldUpdate = false
    
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
            shouldUpdate = true
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
        
        if !showSection {
            let axisChoosen = isFirstSection ? axisXFirstSection : axisXSecondSection
            let trigger = isFirstSection ? axisXFirstSectionTrigger : axisXSecondSectionTrigger
            let index = userSelect(axisChoosen)
            trigger?[index]()
            shouldUpdate.toggle()
        } else {
            showSection = false
            guard let upTrigger = upSectionTrigger,
                  let downTrigger = downSectionTrigger else { return }
            
            if isFirstSection { upTrigger() } else { downTrigger() }
            shouldUpdate.toggle()
        }
    }
    
    private func userSelect(_ option: [Bool]) -> Int {
        let filterIndex = option.enumerated().filter { $1 }.map { $0.0 }
        if filterIndex.count == 0 { return 1 }
        let index = filterIndex[0]
        return index
    }
}
