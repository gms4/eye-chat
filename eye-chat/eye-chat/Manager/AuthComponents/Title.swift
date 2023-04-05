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
            .font(.system(size: 62))
            .foregroundColor(.white)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
