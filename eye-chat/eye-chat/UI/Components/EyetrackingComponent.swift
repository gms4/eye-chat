//
//  EyetrackingComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 01/04/23.
//

import SwiftUI

struct EyetrackingComponent: View {
    
    let style: EyetrackingStyle
    
    var body: some View {
        Image(style == .activate ? ImageAsset.DEACTIVATE_EYETRACKING : ImageAsset.ACTIVATE_EYETRACKING)
    }
}

struct EyetrackingComponent_Previews: PreviewProvider {
    static var previews: some View {
        EyetrackingComponent(style: .activate)
    }
}
