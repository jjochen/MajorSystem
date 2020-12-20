//
// NumbersOrganizerPreferencesView.swift
// MajorSystem
//
// Copyright (c) 2020 Jochen Pfeiffer
//

import Combine
import SwiftUI

struct NumbersOrganizerPreferencesView: View {
    @Binding var isPresented: Bool

    @State private var maxNumberOfDigits = 1

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Picker(selection: $maxNumberOfDigits, label: Text("Maximum number of digits")) {
                        ForEach(1 ..< 5) {
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

struct NumbersOrganizerPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersOrganizerPreferencesView(isPresented: .constant(true))
    }
}
