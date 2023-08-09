//
//  DogModel.swift
//  Dog_App
//
//  Created by Anton Godunov on 09.08.2023.
//

import Foundation


final class DogModel: ObservableObject {
    @Published var model = DogPicModel.init()
    var favoriteDogs: [String]
    
    init(favoriteDogs: [String]) {
        self.favoriteDogs = favoriteDogs
    }
    
    init() {
        self.favoriteDogs = []
    }
    
    private let service = APIService()
    
    func fetchNewImage() {
        service.getImage() { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.model = success
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
