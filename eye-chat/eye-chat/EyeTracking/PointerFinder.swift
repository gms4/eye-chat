//
//  PointerFinder.swift
//  eye-chat
//
//  Created by alexdamascena on 05/04/23.
//

import SwiftUI

struct PointerFinder {
    
    private struct Constants {
        static let TOP_RANGE: CGFloat = -200
    }
    
    let center = CGRect(x: UIScreen.midWidth - 25,
                        y: UIScreen.midHeight - 120,
                        width: 50,
                        height: 100)
    
    
    public func didUserMoveAxisY(pointer: CGRect?) -> Bool {
        guard let pointer = pointer else { return false }
        
        if center.minY + center.height < pointer.minY {
            return true
        }
    
        return false
    }
    
    public func didUseMoveAxisYGrid(pointer: CGRect?) -> [Bool]{
        guard let pointer = pointer else { return [false, true, false] }
        
        if pointer.minY < center.minY - center.height/2 {
            return [true, false, false]
        }
        
        if pointer.minY > center.minY + center.height/2 {
            return [false, false, true]
        }
        
        return [false, true, false]
    }
    
    public func didUserMoveAxisX(pointer: CGRect?) -> [Bool] {
        guard let pointer = pointer else { return PointerFinderValue.mid.rawValue }
        
        if center.minX + center.width < pointer.minX {
            return PointerFinderValue.right.rawValue
        }
        
        if pointer.minX < center.minX  - center.width {
            return PointerFinderValue.left.rawValue
        }
        
        return  PointerFinderValue.mid.rawValue
    }
    
    public func didUserDeselectFirstSection(pointer: CGRect?) -> Bool {
        guard let pointer = pointer else { return false }
        
        if pointer.minY < center.minY - center.height {
            return true
        }
        
        return false
    }
    
    public func didUserGoBack(pointer: CGRect?) -> Bool {
        guard let pointer = pointer else { return false }
        
        if pointer.minX < -200 {
            return true
        }
        
        return false
    }
}
