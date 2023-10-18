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
        

        KFImage(URL(string: UserDefaults.standard.value(forKey: "pic") as! String))
            .resizable()
            .frame(width: 150, height: 100)
            .cornerRadius(20)
            .scaledToFit()
        Text("Hello")
//        Text("\(getInt())")
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
