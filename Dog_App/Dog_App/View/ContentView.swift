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
    @Query private var favoritePicOfDogs: [FavoritesDogs]
    @Environment(\.modelContext) private var modelContext
    @StateObject private var dogViewModel = DogModel()
    @AppStorage("apeared") private var hasAppeared = false
    
    var body: some View {
        
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        switch selectedTab {
                        case .dog:
                            DogViewPort()
                        case .heart:
                            FavoritesDogsView()
                        case .cat:
                            CatView()
                        }
                    }
                }
            }
        }
        VStack {
            CustomTabView(selectedTab: $selectedTab)
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
