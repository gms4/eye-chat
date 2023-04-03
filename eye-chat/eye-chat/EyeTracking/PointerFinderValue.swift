//
//  PointerFinderValue.swift
//  eye-chat
//
//  Created by alexdamascena on 03/04/23.
//

import Foundation

enum PointerFinderValue {
    case left
    case mid
    case right
    
    var rawValue: [Bool] {
        switch self {
        case .left:
            return [true, false, false]
        case .mid:
            return [false, true, false]
        case .right:
            return [false, false, true]
        }
    }
}
