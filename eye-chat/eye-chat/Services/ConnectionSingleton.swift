//
//  ConnectionSingleton.swift
//  eye-chat
//
//  Created by alexdamascena on 07/04/23.
//

import Foundation


class ConnectionSingleton {
    
    static let shared = ConnectionSingleton()
    let connection = Connection()
    
    private init(){}
}
