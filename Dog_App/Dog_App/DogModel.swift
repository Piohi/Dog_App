//
//  DogModel.swift
//  Dog_App
//
//  Created by Anton Godunov on 09.08.2023.
//

import Foundation
import Observation

final class DogModel: ObservableObject {
    @Published var model = DogPicModel.init()
    
    private let service = APIService()
    
    func fetchNewImage() {
        service.getImage() { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.model = success
                    UserDefaults.standard.set(self.model.message, forKey: "pic")
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

struct DogPicModel: Codable {
    var message: String
    let status: String
    
    init(message: String, status: String) {
        self.message = message
        self.status = status
    }
    
    init() {
        self.message = ""
        self.status = ""
    }
}
