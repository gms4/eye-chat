//
//  EyeTrackingTemplate.swift
//  eye-chat
//
//  Created by alexdamascena on 03/04/23.
//

import SwiftUI

enum Content {
    case onlySections
    case sectionsAndGrid
}

struct EyeTrackingTemplate: View {
    
    @ObservedObject var eyeViewModel = EyeTrackingViewModel()
    @ObservedObject var selector = PointerSelector()
    
    @State var endEyeTracking = false
    
    private let content: Content
    
    private let elements: [AnyView]
    
    var attributes: AttributesTrigger
    
    @inlinable public init(axisXFirstSectionTrigger: [Function]? = nil,
                           axisXSecondSectionTrigger: [Function]? = nil,
                           upTrigger: Function? = nil,
                           downTrigger: Function? = nil,
                           goBack: @escaping Function,
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
                    
                    if selector.shouldUpdate {
                       endEyeTracking = true
                    }
                }
                .onChange(of: eyeViewModel.selected){ _ in
                    selector.select()
                }
        }
        .onAppear{
            self.selector.setAttributes(self.attributes)
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
