//
//  ExampleView.swift
//  eye-chat
//
//  Created by alexdamascena on 28/03/23.
//  
//

import SwiftUI

struct ExampleView: View {

    @ObservedObject private var viewModel = ExampleViewModel()
       
    var body: some View {
        Text(viewModel.example ?? "Hello World")
    }

}

struct Example_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}