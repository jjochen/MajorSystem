//
// AppView.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import SwiftUI

struct AppView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        let settings = try! viewContext.fetchOrCreateSettings()
        let mapping = try! settings.currentOrDefaultMapping(inContext: viewContext)
        return NumbersOrganizerView(mapping: mapping)
    }
}

#if DEBUG
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
#endif
