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
    @ObservedObject var settings: Settings

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    MappingPicker(settings: settings)
//                    Picker(selection: $settings.currentMapping,
//                           label: Text("Maximum number of digits")) {
//                        ForEach(0 ..< UserPreferences.maxAvailableNumberOfDigits) {
//                            Text(($0 + 1).description)
//                        }
//                    }
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
        #warning("Needs mock object for user preferences")
        NumbersOrganizerPreferencesView(isPresented: .constant(true), settings: PersistenceController.previewSettings)
    }
}
#endif
