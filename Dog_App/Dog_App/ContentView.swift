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
            Button("Ещё", action: viewModel.fetchNewImage)
                .padding()
                .foregroundColor(.white)
                .background(Color(red: 0, green: 0, blue: 0.5))
                .clipShape(Capsule())
//            AsyncImage(url: URL(string: "\(viewModel.model.message)"))
//
            AsyncImage(url: URL(string: "\(viewModel.model.message)")) { image in image.resizable() }
            placeholder: { Color.red } .frame(width: 300, height: 300) .clipShape(RoundedRectangle(cornerRadius: 25))
                
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
