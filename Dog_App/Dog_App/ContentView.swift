//
//  ContentView.swift
//  Dog_App
//
//  Created by Anton Godunov on 03.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = DogPicViewModel()
    
    var body: some View {
        VStack {
            Text("Вотъ картинка собатьки")
       
            
            if viewModel.model.message.isEmpty {
                                        LoadingView()
                                    } else {
                                        AsyncImage(url: URL(string: "\(viewModel.model.message)")) { image in image.resizable()
                                                .scaledToFit()
                                        }
                                                   placeholder: { Color.cyan } .frame(width: 300, height: 300) .clipShape(RoundedRectangle(cornerRadius: 25))
                                    }
            Button("Ещё", action: viewModel.fetchNewImage)
                .buttonStyle(GrowingButton())
            
                    
                
        }
        .padding()
        .onAppear {
            viewModel.fetchNewImage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
