//
//  CustomTabView.swift
//  Dog_App
//
//  Created by Anton Godunov on 11.10.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case dog
    case heart
    case cat
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) {
                    tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
//                        .foregroundStyle(.white)
                        .font(.system(size: 24))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                        
                    Spacer()
                }
             
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 16)
//            .padding(.bottom, -10)
//            .padding(.horizontal, 45)
            .background(.gray)
            
            
        }
    }
}

#Preview {
    CustomTabView(selectedTab: .constant(.dog))
}
