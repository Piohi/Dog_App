//
//  FavoritesView.swift
//  Dog_App
//
//  Created by Anton Godunov on 09.08.2023.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var favDog: [String]
    var body: some View {
        
        HStack {
            ScrollView(showsIndicators: false) {
                
                ForEach(favDog.indices, id: \.self) {index in
                        FavoriteCell(favorite: favDog[index])
                        
                        Button {
                            favDog.remove(at: index)
                            
                        } label: {
                            Text("Удалить")
                        }.buttonStyle(GrowingButton())
                    }
            }
        }
    }
}

//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}
