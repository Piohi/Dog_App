//
//  CatView.swift
//  Dog_App
//
//  Created by Anton Godunov on 16.08.2023.
//

import SwiftUI
import Kingfisher

struct CatView: View {
    //    func getInt() -> Int {
    //        abort()
    //    }
    var body: some View {
        
        if UserDefaults.standard.value(forKey: "picOfCat") != nil {
            Text("lol")
        } else {
            ContentUnavailableView("catWarning", systemImage: "cat")
        }
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
