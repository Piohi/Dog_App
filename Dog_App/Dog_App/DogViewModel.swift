//
//  DogViewModel.swift
//  Dog_App
//
//  Created by Anton Godunov on 09.08.2023.
//

import SwiftUI

final class FavoriteDogs: ObservableObject {
    @Published var favoriteMassive = DogModel.init()
}


