//
// NumbersOrganizerView.swift
// MajorSystem
//
// Copyright (c) 2020 Jochen Pfeiffer
//

import CoreData
import SwiftUI

struct NumbersOrganizerView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var showingPreferences = false

    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Number.numberOfDigits, ascending: true),
            NSSortDescriptor(keyPath: \Number.value, ascending: true),
        ],
        animation: .default
    )
    private var numbers: FetchedResults<Number>

    var body: some View {
        NavigationView {
            List {
                ForEach(numbers) { number in
                    NumberRow(number: number)
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Numbers")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingPreferences.toggle()
                }) {
                    Image(systemName: "switch.2")
                        .font(.system(.title))
                }
            )
        }
        .sheet(isPresented: $showingPreferences, content: {
            NumbersOrganizerPreferencesView(isPresented: self.$showingPreferences)
        })
    }
}

#if DEBUG
struct NumbersOrganizerView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersOrganizerView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
#endif
