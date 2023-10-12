//
//  Dog_app_widgBundle.swift
//  Dog_app_widg
//
//  Created by Anton Godunov on 10.10.2023.
//

import WidgetKit
import SwiftUI

@main
struct Dog_app_widgBundle: WidgetBundle {
    var body: some Widget {
        Dog_app_widg()
        Dog_app_widgLiveActivity()
    }
}
