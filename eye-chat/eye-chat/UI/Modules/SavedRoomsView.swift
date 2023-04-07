//
//  SavedRoomsView.swift
//  eye-chat
//
//  Created by egln on 04/04/23.
//
import SwiftUI

struct SavedRoomsView: View{
    
    @ObservedObject private var viewModel = SavedRoomsViewModel()
    
    let listOfContacts: [String] = SavedRoomsViewModel().example
    let style: EyetrackingStyle
    
   
    func defineCardColorByIndex(`var` index: Int) -> String{
        
        var cardColor: String
        
        if index % 6 == 0{
            cardColor = "blue-textfield"
        }
        else if index % 6 == 1{
            cardColor = "blue-textfield"
        }
        else if index % 2 == 0{
            cardColor = "light-yellow-card"
        }
        else{
            cardColor = "light-orange-card"
        }
        return cardColor
    }
    
    var body: some View {
        VStack{
           
            VStack(alignment: .center){
                if listOfContacts.count > 0{
                    
                    let columns = [
                        GridItem(spacing: 10),
                        GridItem(spacing: 10),
                        GridItem(spacing: 10)
                    ]
                    
                    LazyVGrid(columns: columns, spacing: 10){
                        ForEach(listOfContacts, id: \.self) { index in
                            let meuArrayIndex: Int = 1 + listOfContacts.firstIndex(of: index)!
                            SavedRoomsCardComponent(cardTitle: index, cardColor: defineCardColorByIndex(var: meuArrayIndex))
                        }
                    }.background(.green)
                }
                else{
                    Text("voce nao tem contatos")
                }
            }.background(.red)
                .frame(maxWidth: 951)
            // .overlay(alignment: .topTrailing)
        }
    }
}


struct SavedRooms_Previews: PreviewProvider {
    static var previews: some View {
        SavedRoomsView(style: .activate)
    }
}
