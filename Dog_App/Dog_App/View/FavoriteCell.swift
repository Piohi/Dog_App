//
//  FavoriteCell.swift
//  Dog_App
//
//  Created by Anton Godunov on 09.08.2023.
//

import SwiftUI
import Kingfisher
import SwiftData

struct FavoriteCell: View {
    
    @Query private var favoriteDogs: [FavoritesDogs]
    @Environment(\.modelContext) private var modelContext
    
    let stingOfpicture: String
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            KFImage(URL(string: stingOfpicture))
                .resizable()
                .frame(width: 150, height: 100)
                .cornerRadius(20)
                .scaledToFit()
            
            Button {
                if !favoriteDogs.isEmpty{
                    modelContext.delete(favoriteDogs.filter {$0.picsOfDogs == stingOfpicture}.first! ) }
                else {return}
                
                
            } label: {
                Image(systemName:  "xmark.circle.fill")
                    .font(.system(size: 25))
                    .foregroundStyle(.red)
            }
        }
    }
}


#Preview {
    FavoriteCell(stingOfpicture: "https://images.dog.ceo/breeds/spitz-japanese/tofu.jpg")
}
