//
//  MajorSystemApp.swift
//  MajorSystem
//
//  Created by Jochen on 04.12.20.
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

