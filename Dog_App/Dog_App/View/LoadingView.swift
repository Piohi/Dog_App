//
//  LoadingView.swift
//  Dog_App
//
//  Created by Anton Godunov on 05.08.2023.
//

import SwiftUI

struct LoadingView: View {
    
    private let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack(spacing: 16) {
            VStack {
                
                
                
                
                Rectangle()
                    .foregroundColor(.clear)
                    .background(.ultraThinMaterial)
                    .frame(width: 300)
                    .frame(height: 300)
                    .cornerRadius(20)
            }
        }
    }
}
