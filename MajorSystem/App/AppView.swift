//
//  AppView.swift
//  MajorSystem
//
//  Created by Jochen on 04.12.20.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            NumbersView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Numbers")
                }
            Text("Trainer")
                .tabItem {
                    Image(systemName: "tray.full")
                    Text("Practice")

                }
            Text("Translator")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Translator")

                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")

                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
