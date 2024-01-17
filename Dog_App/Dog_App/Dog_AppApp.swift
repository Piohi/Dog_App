//
//  Dog_AppApp.swift
//  Dog_App
//
//  Created by Anton Godunov on 03.08.2023.
//

import SwiftUI
import SwiftData

@main
struct Dog_AppApp: App {
    
    let modelContainer: ModelContainer
        
        init() {
            do {
                modelContainer = try ModelContainer(for: FavoritesDogs.self)
            } catch {
                fatalError("Could not initialize ModelContainer")
            }
        }
    
  
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)

    }
}
