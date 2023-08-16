//
//  FavoriteDogView.swift
//  Dog_App
//
//  Created by Anton Godunov on 15.08.2023.
//

import SwiftUI
import Kingfisher

struct FavoriteDogView: View {
    
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
                    .frame(width: 300, height: 200)
                    .cornerRadius(20)
                    .scaledToFill()
                    .scaleEffect()
                    .gesture(magnification)
           
            
        }
            
          
        }
        
    }

//struct FavoriteDogView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteDogView()
//    }
//}
