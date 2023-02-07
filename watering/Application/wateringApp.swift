//
//  wateringApp.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import SwiftUI

@main
struct wateringApp: App {

    var body: some Scene {
        WindowGroup {
            RouterView().environmentObject(RouterController())        }
    }
}
