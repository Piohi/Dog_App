//
//  FavoritesDogs.swift
//  Dog_App
//
//  Created by Anton Godunov on 11.10.2023.
//

import Foundation
import SwiftData

@Model
final class FavoritesDogs {
    
     var picsOfDogs: String
    
    init(picsOfDogs: String) {
        self.picsOfDogs = picsOfDogs
    }
   
   
}
