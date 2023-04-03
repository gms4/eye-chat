//
//  HomeV2View.swift
//  eye-chat
//
//  Created by alexdamascena on 03/04/23.
//  
//

import SwiftUI

struct HomeV2View: View {

    @ObservedObject private var viewModel = HomeV2ViewModel()
       
    @EnvironmentObject var coordinator: ViewCordinator
    
    @State var cordinateFirstSection: [Bool] = [false, false, false]
    @State var cordinateSecondSection: [Bool] = [false, false, false]
        
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
        
        VStack {
            Text("Inicie uma conversa com EyeChat!")
                .font(.system(size: 40))
                .fontWeight(.medium)
            EyeTrackingTemplate(
                upTrigger: rightFirstSection,
                downTrigger: leftFirstSection,
                goBack: goBack, elements: [ EyeButtonComponent(style: .createRoom).anyView, EyeButtonComponent(style: .savedRoom).anyView]
            )
        }
    }
}

struct HomeV2_Previews: PreviewProvider {
    static var previews: some View {
        HomeV2View()
    }
}
