//
//  DogImgView.swift
//  Dog_App
//
//  Created by Anton Godunov on 03.08.2023.
//

import Foundation



final class DogPicViewModel: ObservableObject {
    @Published var model = DogPicModel.init()
    
    
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
