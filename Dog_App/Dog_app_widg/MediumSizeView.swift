//
//  MediumSizeView.swift
//  Dog_app_widgExtension
//
//  Created by Anton Godunov on 10.10.2023.
//

import SwiftUI
import WidgetKit

struct ViewSizeEntry: TimelineEntry {
    let date: Date
    let providerInfo: String
}

struct MediumSizeView: View {
    let entry: ViewSizeEntry
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                
                Text("cat")
                    
                
                Text(entry.providerInfo)
                    .font(.footnote)
            }
            .containerBackground(for: .widget) {
                Color.green
            }
        }
    }
}

