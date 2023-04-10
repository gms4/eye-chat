//
//  RoomsView.swift
//  eye-chat
//
//  Created by alexdamascena on 10/04/23.
//  
//

import SwiftUI

struct RoomsView: View {

    @ObservedObject private var viewModel = RoomsViewModel()
       
    var body: some View {
        Text(viewModel.example ?? "Hello World")
    }

}

struct Rooms_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView()
    }
}