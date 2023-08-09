//
//  ImageModel.swift
//  Dog_App
//
//  Created by Anton Godunov on 03.08.2023.
//

import Foundation
import Combine

struct DogPicModel: Codable {
    let message: String
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
