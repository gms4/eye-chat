//
//  SavedRoomsView.swift
//  eye-chat
//
//  Created by egln on 04/04/23.
//
import SwiftUI

struct SavedRoomsView: View{
    
    let listOfContacts: [String] = SavedRoomsViewModel().example
    let style: EyetrackingStyle
    
    var body: some View {
        
        //MARK: coisas estranhas
        
        VStack(alignment: .leading){
            Text(ContentComponent.SAVED_ROOMS)
                .font(.custom(ContentComponent.B, size: 48))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
            VStack (alignment: .center) {
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
                    }
                }
                else {
                    
                }
            }
            .frame(maxWidth: 951)
            
        }.padding([.top], 180)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .overlay(alignment: .topTrailing) {
            Image(ImageAsset.LOGO_SCREENS)
                .frame(maxWidth: 20.su, maxHeight: 17.14.su)
        }
        .overlay(alignment: .bottomLeading) {
            EyetrackingComponent(style: .activate)
                .frame(maxWidth: 110, maxHeight: 130)
        }
        
    }
}


struct SavedRooms_Previews: PreviewProvider {
    static var previews: some View {
        SavedRoomsView(style: .activate)
    }
}

extension SavedRoomsView{
    
    //Função que defina lógica de coloração cards de sala
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
    
    
}
