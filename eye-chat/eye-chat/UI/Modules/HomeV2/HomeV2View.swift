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
        
    public func leftFirstSection(){
        coordinator.push(view: .video)
    }
    
    public func midFirstSection(){
        coordinator.push(view: .create)
    }
    
    public func rightFirstSection(){
        print("entrou aqui")
        coordinator.push(view: .video)
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
            EyeTrackingTemplate(
                upTrigger: rightFirstSection,
                downTrigger: leftFirstSection,
                spacing: 36,
                elements: [ EyeButtonComponent(style: .createRoom).anyView,
                            EyeButtonComponent(style: .savedRoom).anyView]
            )
        }
        .padding(.top, 45)
        .overlay {
            VStack(alignment: .leading) {
                HStack {
                    Text(ContentComponent.INITIATE_CHAT)
                        .font(.custom(ContentComponent.M, size: 44))
                    Spacer()
                }
          
                Spacer()
                
            }.frame(width: UIScreen.screenWidth - 70, height: UIScreen.screenHeight * 0.9)
        }
    }
}

//struct HomeV2_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeV2View()
//    }
//}
