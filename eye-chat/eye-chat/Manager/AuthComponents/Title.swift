//
//  Title.swift
//  eye-chat
//
//  Created by Guilherme Souza on 04/04/23.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Com **eyechat** você\nmesmo pode começar\na conversa")
            .font(.custom("Dosis-Regular", size: 68))
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
