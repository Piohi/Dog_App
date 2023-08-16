//
//  ContentView.swift
//  Dog_App
//
//  Created by Anton Godunov on 03.08.2023.
//

import SwiftUI
import Combine



struct ContentView: View {
    
    @StateObject var viewModel = DogModel()
    @State private var isFavorite: Bool = false
    @State var favoriteMassiv: [String]
    
    var body: some View {
        
        TabView {
            
           
            
            VStack {
                Text("Вотъ картинка собатьки")
                
                
                
                if viewModel.model.message.isEmpty {
                    LoadingView()
                } else { VStack {
                    Button {
                        isFavorite.toggle()
                        if favoriteMassiv.contains(viewModel.model.message)
                        {
                            favoriteMassiv.removeLast()
                        }
                        else {
                            favoriteMassiv.append(viewModel.model.message)
                        }
                        print(favoriteMassiv)
                    } label: {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .font(.title)
                        
                    }
                    AsyncImage(url: URL(string: "\(viewModel.model.message)")) { image in image.resizable()
                            .scaledToFit()
                    }
                placeholder: { Color.cyan } .frame(width: 300, height: 300) .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                    
                }
                Button {
                    viewModel.fetchNewImage()
                    if isFavorite == true  {isFavorite.toggle()}
                } label: {
                    Text("Ещё")
                }.buttonStyle(GrowingButton())
                
                
                
            }
            .padding()
            
            .tabItem {
                Label("Картинки", systemImage: "house.fill")
                
                
            }
                
                
                FavoritesView(favDog: $favoriteMassiv)
                    .tabItem {
                        Label("Сохранено", systemImage: "heart.circle")
                    }.onAppear {
                        viewModel.fetchNewImage()
                        isFavorite = false
                        
                
                
                
         }
            CatView()
                    .tabItem{
                        Label("Кошки", systemImage: "fleuron.fill")
                    }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(favoriteMassiv : [])
    }
}
