//
//  MediumSizeView.swift
//  Dog_app_widgExtension
//
//  Created by Anton Godunov on 10.10.2023.
//

import SwiftUI
import WidgetKit
import Kingfisher

struct MediumSizeView: View {
//    var entry: SimpleEntry
    @StateObject var viewModel = DogModel()
//    @Binding var favDog: [String]
//    var favorite: String
    
    var body: some View {
        
        HStack{
            
//            KFImage(URL(string: favorite))
//                .resizable()
//                .frame(width: 200, height: 150)
//                .cornerRadius(20)
//                .scaledToFill()
                
//            Image(systemName: "person")
//                .resizable()
//                .scaledToFit()
//                .foregroundStyle(.secondary)
        }
        .onAppear{
            viewModel.fetchNewImage()
        }
    }
}
