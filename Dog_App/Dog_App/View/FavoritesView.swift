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
            VStack(alignment: .center, spacing: 25) {
                
                    ForEach(favDog, id: \.self) {favDog in
                        FavoriteCell(favorite: favDog)
                        
                        Button {
                            favDog.dropLast()
                            
                        } label: {
                            Text("X")
                        }
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
