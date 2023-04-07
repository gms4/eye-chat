//
//  PointerSelector.swift
//  eye-chat
//
//  Created by alexdamascena on 05/04/23.
//

import SwiftUI

class PointerSelector: ObservableObject {

    @Published var upOrDown = false
    @Published var isFirstSection = true
    @Published var showSection = true
    @Published var needMove = true

    @Published var axisXFirstSection = [false, false, false]
    @Published var axisXSecondSection = [false, false, false]
    @Published var axisXThirdSection = [false, false, false]
    
    @Published var axisYSection: [Bool]?
    
    @Published var axisXFirstSectionTrigger: [Function]?
    @Published var axisXSecondSectionTrigger: [Function]?
    @Published var axisXThirdSectionTrigger: [Function]?
    
    @Published var upSectionTrigger: Function?
    @Published var downSectionTrigger: Function?
    @Published var goBack: Function?
        
    @Published var shouldUpdate = 0
    
    @Published var content: Content = .onlySections
    
    var pointerFinder = PointerFinder()
    
    func setAttributes(_ attributes: AttributesTrigger){
        self.axisXFirstSectionTrigger = attributes.axisXFirstSectionTrigger
        self.axisXSecondSectionTrigger = attributes.axisXSecondSectionTrigger
        self.axisXThirdSectionTrigger = attributes.axisXThirdSectionTrigger
        self.upSectionTrigger = attributes.upTrigger
        self.downSectionTrigger = attributes.downTrigger
        self.goBack = attributes.goBack
        self.axisYSection = content == .sectionsAndGrid ? [false, true, false] : nil
        
    }
    
    func execute(pointerSection: CGRect?){
        guard let pointer = pointerSection else { return }
        
        upOrDown =  pointerFinder.didUserMoveAxisY(pointer: pointer)
        
        if content == .sectionsAndGrid && needMove {
            axisYSection = pointerFinder.didUseMoveAxisYGrid(pointer: pointer)
        }
        
        let newAxisX = pointerFinder.didUserMoveAxisX(pointer: pointer)
        
        let isGoBack = pointerFinder.didUserGoBack(pointer: pointer)
        
        if isGoBack {
            goBack?()
            shouldUpdate = -1
        }


//        if !showSection && isFirstSection {
//            axisXFirstSection = newAxisX
//            axisXSecondSection = axisXFirstSection.map { _ in false }
//
//        }
//
//        if !showSection && !isFirstSection {
//            axisXSecondSection = newAxisX
//            axisXFirstSection = axisXSecondSection.map { _ in false }
//        }
        
        if let showAxisY = axisYSection {
            
            if !showSection && showAxisY[0] {
                axisXFirstSection = newAxisX
                axisXSecondSection = axisXSecondSection.map{ _ in false }
                axisXThirdSection = axisXThirdSection.map { _ in false }
            }
            
            if !showSection && showAxisY[1] {
                axisXSecondSection = newAxisX
                axisXFirstSection = axisXFirstSection.map{ _ in false }
                axisXThirdSection = axisXThirdSection.map{ _ in false}
            }
            
            if !showSection && showAxisY[2] {
                axisXThirdSection = newAxisX
                axisXFirstSection = axisXFirstSection.map { _ in false }
                axisXSecondSection = axisXSecondSection.map { _ in false }
            }
        }

        if showSection {
            axisXFirstSection = axisXSecondSection.map { _ in false }
            axisXSecondSection = axisXFirstSection.map { _ in false }
        }

        if !showSection {
            showSection = pointerFinder.didUserDeselectFirstSection(pointer: pointer)
            needMove = showSection
            
            if needMove {
                axisXFirstSection = axisXSecondSection.map { _ in false }
                axisXSecondSection = axisXFirstSection.map { _ in false }
                axisXThirdSection = axisXThirdSection.map{ _ in false}
            }
        }
    
    }
    
    func select(){
        isFirstSection = !upOrDown
        
        if content == .sectionsAndGrid && showSection {
            showSection = false
            return
        }
        
        if content == .sectionsAndGrid {
            if !showSection {
                let axisTrigger = [axisXFirstSectionTrigger,
                                   axisXSecondSectionTrigger,
                                   axisXThirdSectionTrigger]
                let axisSection = [ axisXFirstSection, axisXSecondSection, axisXThirdSection ]
                let indexAxisY = userSelect(axisYSection ?? [])
                
                let trigger = axisTrigger[indexAxisY]
                let section = axisSection[indexAxisY]
                
                let index = userSelect(section)
                trigger?[index]()
            } else {
                showSection = false
                needMove = false
            }
        } else {
            
            if !showSection {
                let axisChoosen = isFirstSection ? axisXFirstSection : axisXSecondSection
                let trigger = isFirstSection ? axisXFirstSectionTrigger : axisXSecondSectionTrigger
                let index = userSelect(axisChoosen)
                trigger?[index]()
            } else {
                
                showSection = false
//                needMove = false
                
//                if content == .sectionsAndGrid {
//                    return
//                }
                
                guard let upTrigger = upSectionTrigger,
                      let downTrigger = downSectionTrigger else { return }

                if isFirstSection { upTrigger() } else { downTrigger() }
            }
            
        }
        
        
    }
    
    private func userSelect(_ option: [Bool]) -> Int {
        let filterIndex = option.enumerated().filter { $1 }.map { $0.0 }
        if filterIndex.count == 0 { return 1 }
        let index = filterIndex[0]
        return index
    }
}
