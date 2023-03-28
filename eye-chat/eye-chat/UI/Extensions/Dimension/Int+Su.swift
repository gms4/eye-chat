//
//  Int+Su.swift
//  eye-chat
//
//  Created by alexdamascena on 28/03/23.
//

import SwiftUI

extension Int {
    
    var su: CGFloat {
        convertToSu(dimensionSize: CGFloat(self))
    }
    
    private func convertToSu(dimensionSize: CGFloat) -> CGFloat {
        return CGFloat(7 * dimensionSize)
    }
}
