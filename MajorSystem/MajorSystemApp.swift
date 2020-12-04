//
//  MajorSystemApp.swift
//  MajorSystem
//
//  Created by Jochen on 04.12.20.
//

import SwiftUI

@main
struct MajorSystemApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
