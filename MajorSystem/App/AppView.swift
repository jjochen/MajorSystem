//
// AppView.swift
// MajorSystem
//
// Copyright (c) 2020 Jochen Pfeiffer
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
            Text("Practice")
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
