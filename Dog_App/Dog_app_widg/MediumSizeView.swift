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
                
                Text("\(Int(geometry.size.width)) x \(Int(geometry.size.height))")
                    .font(.system(.title2, weight: .bold))
                    
                
                Text(entry.providerInfo)
                    .font(.footnote)
            }
            .containerBackground(for: .widget) {
                Color.green
            }
        }
    }
}

