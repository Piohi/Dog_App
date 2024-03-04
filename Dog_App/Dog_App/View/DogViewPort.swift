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
    @State var bounceValue = 0
    @State var bounceValueFav = 0
    var body: some View {
        
        if UserDefaults.standard.value(forKey: "pic") != nil {
            
            VStack(spacing: 30) {
                //Отображает загруженную строку в юзердефолтс в виде картинки
                KFImage(URL(string: UserDefaults.standard.value(forKey: "pic") as! String))
                    .resizable()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                    .scaledToFit()
                
                HStack(spacing: 60)  {
                    
                    //Ищем загруженную строку в ЮзерДефолтс и в Базе, если есть красим кнопку в красный, если нет - кнопка не закрашена при нажатии сохраняем данные из юзер дефолтс в базу и кнопка красится
                    Button {
                        if  favoritePicOfDogs.contains(where: {
                            $0.picsOfDogs == UserDefaults.standard.value(forKey: "pic") as! String
                        }){
                            modelContext.delete(favoritePicOfDogs.filter{ $0.picsOfDogs == UserDefaults.standard.value(forKey: "pic") as! String }.first!)
                            bounceValueFav -= 1
                        }
                        else {
                            modelContext.insert(FavoritesDogs(picsOfDogs: "\(UserDefaults.standard.value(forKey: "pic") as! String)"))
                            bounceValueFav += 1
                        }
                        
                    } label: {
                        Image(systemName: favoritePicOfDogs.contains(where: {
                            $0.picsOfDogs == UserDefaults.standard.value(forKey: "pic") as! String
                        }) ? "heart.fill" : "heart")
                        .font(.system(size: 40))
                        .foregroundStyle(favoritePicOfDogs.contains(where: {
                            $0.picsOfDogs == UserDefaults.standard.value(forKey: "pic") as! String
                        }) ? .red : .gray)
                        .symbolEffect(favoritePicOfDogs.contains(where: {
                            $0.picsOfDogs == UserDefaults.standard.value(forKey: "pic") as! String
                        }) ? .bounce.up.byLayer : .bounce.down.wholeSymbol , value: bounceValueFav)
                        
                    }
                    // Кнопка загружает новую строку из АПИшки в юзердефолтс
                    VStack {
                        Button {
                            dogViewModel.fetchNewImage()
                            bounceValue += 1
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath.circle.fill", variableValue: 1.00)
                                .symbolRenderingMode(.monochrome)
                                .foregroundColor(Color.gray)
                                .font(.system(size: 40, weight: .bold))
                                .symbolEffect(.bounce.up.byLayer, value: bounceValue)
                        }
                    }
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
