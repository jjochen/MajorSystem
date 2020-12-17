//
// MajorSystemApp.swift
// MajorSystem
//
// Copyright (c) 2020 Jochen Pfeiffer
// Created by Jochen on 17.12.20.
//

import SwiftUI

@main
struct MajorSystemApp: App {
    let persistenceController = PersistenceController()

    var body: some Scene {
        WindowGroup {
            AppView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
