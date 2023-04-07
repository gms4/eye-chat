//
//  OpaView.swift
//  eye-chat
//
//  Created by alexdamascena on 05/04/23.
//  
//

import SwiftUI

struct OpaView: View {

    @ObservedObject private var viewModel = OpaViewModel()
       
    var body: some View {
        Text(viewModel.example ?? "Hello World")
    }

}

struct Opa_Previews: PreviewProvider {
    static var previews: some View {
        OpaView()
    }
}