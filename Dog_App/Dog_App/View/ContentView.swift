//
//  ContentView.swift
//  Dog_App
//
//  Created by Anton Godunov on 03.08.2023.
//

import SwiftUI
import SwiftData



struct ContentView: View {
    
    @State private var selectedTab: Tab = .dog

    
    
    var body: some View {
        
//        TabView {
//            VStack(spacing: 30) {
//                Button {
//                    isFavorite.toggle()
//                    if favoriteMassiv.contains(viewModel.model.message)
//                    {
//                        favoriteMassiv.removeLast()
//                    }
//                    else {
//                        favoriteMassiv.append(viewModel.model.message)
//                    }
//                    print(favoriteMassiv)
//                } label: {
//                    Image(systemName: isFavorite ? "heart.fill" : "heart")
//                        .font(.title)
//                    
//                }
//                AsyncImage(url: URL(string: "\(viewModel.model.message)")) { image in image.resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
//                }
//            placeholder: { Color.cyan } .frame(width: 300, height: 300) .clipShape(RoundedRectangle(cornerRadius: 25))
//                
//                
//                
//                Button {
//                    viewModel.fetchNewImage()
//                    if isFavorite == true  {isFavorite.toggle()}
//                } label: {
//                    Text("Ещё")
//                }.buttonStyle(GrowingButton())
//                
//                
//                
//            }
//            .onAppear {
//                viewModel.fetchNewImage()
//                isFavorite = false
//            }
//                        .padding()
//            .tabItem {
//                Label("Картинки", systemImage: "house.fill")
//                
//                
//            }
//            
//            
//            FavoritesView(favDog: $favoriteMassiv)
//                .tabItem {
//                    Label("Сохранено", systemImage: "heart.circle")
//                }.onAppear {
//                    viewModel.fetchNewImage()
//                    isFavorite = false
//                }
//            CatView()
//                .tabItem{
//                    Label("Кошки", systemImage: "cat")
//                }
////                .modelContainer(for: FavoriteGogs.self)
//        }
//        ZStack {
//            VStack {
//                TabView(selection: $selectedTab) {
//                    ForEach(Tab.allCases, id: \.rawValue) { tab in
//                        switch selectedTab {
//                        case .dogs:
//                           //
//                        case .heart:
//                            FavoriteDogView(favorite: $favoriteMassiv)
//                        case .cat:
//                            CatView()
//                        }
//                    }
//                }
//                
//                
//            }
//            
//            
//            VStack {
//                Spacer()
//                CustomTabView(selectedTab: $selectedTab)
//                
//            }
//        }
//        .modelContainer(for: FavoriteDogs.self)
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        switch selectedTab {
                        case .dog:
                            DogsView()
                        case .heart:
                            CatView()
                        case .cat:
                            CatView()
                       
                        }
                        
                    }
                }
            }
            
            VStack {
                Spacer()
                CustomTabView(selectedTab: $selectedTab)
                
            }
        }
       
       
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
