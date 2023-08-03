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
            Text("Вотъ фотка собатьки")
            AsyncImage(url: URL(string: "\(viewModel.model.message)"))
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
