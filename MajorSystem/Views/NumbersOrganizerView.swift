//
// NumbersOrganizerView.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import CoreData
import SwiftUI

struct NumbersOrganizerView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @EnvironmentObject private var userPreferences: UserPreferences
//    @FetchRequest(
//        sortDescriptors: [
//            NSSortDescriptor(keyPath: \Number.numberOfDigits, ascending: true),
//            NSSortDescriptor(keyPath: \Number.value, ascending: true),
//        ],
//        animation: .default
//    )
//    private var numbers: FetchedResults<Number>

    @State var isPreferencesViewPresented = false

    @ObservedObject var mapping: Mapping

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
            NumbersOrganizerPreferencesView(isPresented: self.$isPreferencesViewPresented, settings: mapping.settings!)
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
