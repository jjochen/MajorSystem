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
            List(numbers) { number in
                NumberRow(number: number)
            }
            .navigationBarTitle("Organizer")
            .toolbar {
                Button(action: showPreferences) {
                    Label("Preferences", systemImage: "gear")
                }
            }
        }
    }

    private func showPreferences() {
        
    }

    private func addItem() {
        withAnimation {
            let newNumber = Number(context: viewContext)
            newNumber.numberOfDigits = 2
            newNumber.value = 42
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { numbers[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.allowsFloats = false
    return formatter
}()

struct NumbersOrganizerView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersOrganizerView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
