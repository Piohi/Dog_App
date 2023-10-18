////
////  DogViewLand.swift
////  Dog_App
////
////  Created by Anton Godunov on 17.10.2023.
////
//
//import SwiftUI
//
//import SwiftUI
//import SwiftData
//import Kingfisher
//
//struct DogViewLand: View {
//    
//    @Query private var favoritePicOfDogs: [FavoritesDogs]
//    @Environment(\.modelContext) private var modelContext
//    @StateObject private var dogViewModel = DogModel()
//    @Environment(\.scenePhase) var scenePhase
//
//    var body: some View {
//        
//        HStack(spacing: 30) {
//            Button {
//                if  favoritePicOfDogs.contains(where: {
//                    $0.picsOfDogs == dogViewModel.model.message
//                }){
//                    modelContext.delete(favoritePicOfDogs.filter{ $0.picsOfDogs == dogViewModel.model.message }.first!)
//                }
//                else {
//                    modelContext.insert(FavoritesDogs(picsOfDogs: "\(dogViewModel.model.message)"))
//                }
//                    
//            } label: {
//                Image(systemName: favoritePicOfDogs.contains(where: {
//                    $0.picsOfDogs == dogViewModel.model.message
//                }) ? "heart.fill" : "heart")
//                .animation(.bouncy)
//                    .font(.title)
//                    .foregroundStyle(.gray)
//                    
//                
//            }
//            AsyncImage(url: URL(string: "\(dogViewModel.relatePic)")) { image in image.resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
//            }
//        placeholder: { Color.cyan } .frame(width: 300, height: 300) .clipShape(RoundedRectangle(cornerRadius: 25))
//            
//            
//            Button {
//                dogViewModel.fetchNewImage()
//                dogViewModel.relatePic = dogViewModel.model.message
////                if isFavorite == true  {isFavorite.toggle()}
//            } label: {
//                Text("Ещё")
//            }.buttonStyle(GrowingButton())
//            
//            
//            
//        }
//        .onChange(of: scenePhase) { newPhase in
//            switch newPhase {
//            case .inactive :
//                return
//            case .background:
//                return
//            case .active:
//                if dogViewModel.relatePic == "" {
//                    dogViewModel.fetchNewImage()
//                    dogViewModel.relatePic = dogViewModel.model.message}
//                else { return}
//            @unknown default:
//                return
//
//            }
////        .onAppear {
////            dogViewModel.fetchNewImage()
//        }
//    }
//}
//
//
////
////#Preview {
////    DogViewLand()
////}
