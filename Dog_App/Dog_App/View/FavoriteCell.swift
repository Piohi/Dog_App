//
//  FavoriteCell.swift
//  Dog_App
//
//  Created by Anton Godunov on 09.08.2023.
//

import SwiftUI
import Kingfisher

struct FavoriteCell: View {
    
    @GestureState var scale = 1.0
    var  magnification: some Gesture {
        MagnificationGesture()
            .updating($scale) { currentState, pastState, transaction in
                pastState = currentState
                
            }
    }
    
    let favorite: String
    
    var body: some View {
        HStack {
            
           
            KFImage(URL(string: favorite))
                    .resizable()
                    .frame(width: 200, height: 150)
                    .cornerRadius(20)
                    .scaledToFill()
                    .scaleEffect(scale)
                    .gesture(magnification)
           
            
        }
            
          
        }
        
    }


