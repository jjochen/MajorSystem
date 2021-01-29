//
// NumbersOrganizerPreferencesView.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import Combine
import SwiftUI

struct NumbersOrganizerPreferencesView: View {
    @Binding var isPresented: Bool
    @State private var maxNumberOfDigits = 1
    @EnvironmentObject var userPreferences: UserPreferences

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Picker(selection: $userPreferences.maxNumberOfDigitsInOrganizer, label: Text("Maximum number of digits")) {
                        ForEach(0 ..< 4) {
                            Text($0.description)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Preferences"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.isPresented = false
                }) {
                    Text("Done").bold()
                })
        }
    }
}

#if DEBUG
struct NumbersOrganizerPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersOrganizerPreferencesView(isPresented: .constant(true))
    }
}
#endif
