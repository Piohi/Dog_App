//
//  FavoritesDogsView.swift
//  Dog_App
//
//  Created by Anton Godunov on 15.10.2023.
//

import SwiftUI
import SwiftData

struct FavoritesDogsView: View {
    @Query private var favoriteDogs: [FavoritesDogs]
    @Environment(\.modelContext) private var modelContext
    private let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(favoriteDogs) { dog in
                    FavoriteCell(stingOfpicture: dog.picsOfDogs)
                }
            }
        }
        
    }
}


#Preview {
    FavoritesDogsView()
}
