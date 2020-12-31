//
// MajorSystemApp.swift
// MajorSystem
//
// Copyright (c) 2020 Jochen Pfeiffer
//

import SwiftUI

@main
struct MajorSystemApp: App {
    let persistenceController = PersistenceController()
    let userPreferences = UserPreferences()

    var body: some Scene {
        WindowGroup {
            AppView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(userPreferences)
        }
    }
}
