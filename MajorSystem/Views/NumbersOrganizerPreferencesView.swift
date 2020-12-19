//
// SettingsView.swift
// MajorSystem
//
// Copyright (c) 2020 Jochen Pfeiffer
//

import SwiftUI

struct NumbersOrganizerPreferencesView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {}
            }
            .navigationBarTitle("Preferences")
        }
    }
}

struct NumbersOrganizerPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersOrganizerPreferencesView()
    }
}
