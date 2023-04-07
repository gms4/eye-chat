//
//  ViewCoordinator.swift
//  eye-chat
//
//  Created by alexdamascena on 07/04/23.
//

import Foundation


class ViewCoordinator: ObservableObject {
    
    @Published var path: [RouteScreen] = []
    
    func push(new view: RouteScreen){
        path.append(view)
    }
    
    func pop(){
        path.removeLast()
    }
}
