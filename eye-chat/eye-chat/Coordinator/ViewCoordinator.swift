//
//  ViewCoordinator.swift
//  eye-chat
//
//  Created by alexdamascena on 03/04/23.
//

import SwiftUI

class ViewCordinator: ObservableObject {
    
    @Published var path: [RouteScreen] = []
    
    func push(view newView: RouteScreen){
        path.append(newView)
    }
    
    func pop(){
        path.removeLast()
    }
}
