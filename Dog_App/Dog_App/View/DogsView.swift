//
//  DogsView.swift
//  Dog_App
//
//  Created by Anton Godunov on 11.10.2023.
//

import SwiftUI
import SwiftData


struct DogsView: View {
    @Query private var favoritePicOfDogs: [FavoritesDogs]
    @Environment(\.modelContext) private var modelContext
    @StateObject private var dogViewModel = DogModel()
    var body: some View {
//        var isFavorite: Bool = favoritePicOfDogs.contains(where: {$0.picsOfDogs == dogViewModel.model.message})
        VStack(spacing: 30) {
            Button {
                if  favoritePicOfDogs.contains(where: {
                    $0.picsOfDogs == dogViewModel.model.message
                }){
                    modelContext.delete(favoritePicOfDogs.filter{ $0.picsOfDogs == dogViewModel.model.message }.first!)
                }
                else {
                    modelContext.insert(FavoritesDogs(picsOfDogs: "\(dogViewModel.model.message)"))
                }
                    
            } label: {
                Image(systemName: favoritePicOfDogs.contains(where: {
                    $0.picsOfDogs == dogViewModel.model.message
                }) ? "heart.fill" : "heart")
                .animation(.bouncy)
                    .font(.title)
                    .foregroundStyle(.gray)
                    
                
            }
            AsyncImage(url: URL(string: "\(dogViewModel.model.message)")) { image in image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            }
        placeholder: { Color.cyan } .frame(width: 300, height: 300) .clipShape(RoundedRectangle(cornerRadius: 25))
            
            
            
            Button {
                dogViewModel.fetchNewImage()
//                if isFavorite == true  {isFavorite.toggle()}
            } label: {
                Text("Ещё")
            }.buttonStyle(GrowingButton())
            
            
            
        }
        .animation(.easeInOut, value: favoritePicOfDogs.contains(where: {
            $0.picsOfDogs == dogViewModel.model.message
        }))
//        .modelContainer(for: FavoritesDogs.self)
        .onAppear {
            dogViewModel.fetchNewImage()
        }
    }
}

#Preview {
    DogsView()
}
