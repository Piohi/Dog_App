//
//  DogViewPort.swift
//  Dog_App
//
//  Created by Anton Godunov on 11.10.2023.
//

import SwiftUI
import SwiftData
import Kingfisher

struct DogViewPort: View {
    
    @Query private var favoritePicOfDogs: [FavoritesDogs]
    @Environment(\.modelContext) private var modelContext
    @StateObject private var dogViewModel = DogModel()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        if UserDefaults.standard.value(forKey: "pic") != nil {
            
            VStack(spacing: 30) {
                
                
                KFImage(URL(string: UserDefaults.standard.value(forKey: "pic") as! String))
                    .resizable()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                    .scaledToFit()
                
                HStack(spacing: 60)  {
                    
                    
                    
                    Button {
                        if  favoritePicOfDogs.contains(where: {
                            $0.picsOfDogs == UserDefaults.standard.value(forKey: "pic") as! String
                        }){
                            modelContext.delete(favoritePicOfDogs.filter{ $0.picsOfDogs == UserDefaults.standard.value(forKey: "pic") as! String }.first!)
                        }
                        else {
                            modelContext.insert(FavoritesDogs(picsOfDogs: "\(UserDefaults.standard.value(forKey: "pic") as! String)"))
                        }
                        
                    } label: {
                        Image(systemName: favoritePicOfDogs.contains(where: {
                            $0.picsOfDogs == UserDefaults.standard.value(forKey: "pic") as! String
                        }) ? "heart.fill" : "heart")
                        .font(.system(size: 40))
                        .foregroundStyle(favoritePicOfDogs.contains(where: {
                            $0.picsOfDogs == UserDefaults.standard.value(forKey: "pic") as! String
                        }) ? .red : .gray)
                        
                    }
                    Button {
                        dogViewModel.fetchNewImage()
                        
                    } label: {
                        Text("buttonToGetNewPic")
                    }.buttonStyle(GrowingButton())
                }
            }
        } else {
            VStack {
            ContentUnavailableView("dogWarning", systemImage: "dog")
                Button {
                    dogViewModel.fetchNewImage()
                    
                } label: {
                    Text("startButton")
                }.buttonStyle(GrowingButton())
        }
        }
        }
    }
        


#Preview {
    DogViewPort()
}
