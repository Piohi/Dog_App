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
                List {
                    ForEach(favDog.indices, id: \.self) {index in
                        FavoriteCell(stingOfpicture: favDog[index])
                    }.onDelete(perform: { indexSet in
                        favDog.remove(atOffsets: indexSet)
                    })
                }
    }
}

