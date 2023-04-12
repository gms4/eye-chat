//
//  VideoView.swift
//  eye-chat
//
//  Created by alexdamascena on 07/04/23.
//  
//

import SwiftUI

struct VideoView: View {
    
    @EnvironmentObject var coordinator: ViewCordinator
    @ObservedObject private var viewModel = VideoViewModel()
    
    @State var web = ConnectionSingleton.shared
    
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
        VStack {
            VideoStream(webRTCClient: web.connection.webRTCClient)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 0.45)
                .padding(.bottom, UIScreen.screenHeight/2)
        }
        .overlay{
            KeyboardReactionsComponent()
                .padding(.top, UIScreen.screenHeight/2.5)
        }
    }
}

struct Video_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
