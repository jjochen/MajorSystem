//
// AppView.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import SwiftUI

struct AppView: View {
    var body: some View {
        NumbersOrganizerView()
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
