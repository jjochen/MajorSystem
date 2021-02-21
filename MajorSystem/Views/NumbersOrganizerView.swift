//
// NumbersOrganizerView.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import CoreData
import SwiftUI

struct NumbersOrganizerView: View {
    @ObservedObject var mapping: Mapping
    @State var isPreferencesViewPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(mapping.sortedNumbers) { number in
                    NavigationLink(destination:
                        NumberDetailView(number: number)) {
                        NumberRow(number: number)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Numbers")
            .navigationBarItems(trailing:
                Button(action: {
                    self.isPreferencesViewPresented.toggle()
                }) {
                    Image(systemName: "switch.2")
                        .font(.system(.title))
                }
            )
        }
        .sheet(isPresented: $isPreferencesViewPresented, content: {
            NumbersOrganizerPreferencesView(settings: mapping.settings!, isPresented: self.$isPreferencesViewPresented)
        })
    }
}

#if DEBUG
struct NumbersOrganizerView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersOrganizerView(mapping: PersistenceController.previewMapping)
    }
}
#endif
