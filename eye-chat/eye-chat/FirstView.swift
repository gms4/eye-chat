//
//  FirstView.swift
//  eye-chat
//
//  Created by alexdamascena on 28/03/23.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        VStack {

            NavigationLink(value: RouteScreen.create){
                Text("route create")
            }
            
            NavigationLink(value: RouteScreen.main){
                Text("route main")
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
