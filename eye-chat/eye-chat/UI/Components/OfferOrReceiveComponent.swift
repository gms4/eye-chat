//
//  OfferOrReceiveComponent.swift
//  eye-chat
//
//  Created by Guilherme Souza on 11/04/23.
//

import SwiftUI

struct OfferOrReceiveComponent: View {
    
    let style: OfferOrReceiveStyle
    
    var anyView: AnyView {
        return AnyView(self)
    }
    
    var body: some View {
        Image(style == .offer ? ImageAsset.OFFER : ImageAsset.RECEIVE)
    }
}

struct OfferOrReceiveComponent_Previews: PreviewProvider {
    static var previews: some View {
        OfferOrReceiveComponent(style: .offer)
    }
}
