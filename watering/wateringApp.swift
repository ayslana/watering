//
//  wateringApp.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import SwiftUI

@main
struct wateringApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
