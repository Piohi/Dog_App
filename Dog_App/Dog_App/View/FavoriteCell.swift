//
//  FavoriteCell.swift
//  Dog_App
//
//  Created by Anton Godunov on 09.08.2023.
//

import SwiftUI
import Kingfisher

struct FavoriteCell: View {
    
    let favorite: String
    
    var body: some View {
        HStack {
            
           
            KFImage(URL(string: favorite))
                    .resizable()
                    .frame(width: 200, height: 150)
                    .cornerRadius(20)
                    .scaledToFit()}
            
          
        }
        
    }


