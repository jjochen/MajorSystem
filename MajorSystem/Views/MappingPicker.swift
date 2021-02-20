//
// MappingPicker.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import SwiftUI

struct MappingPicker: View {
    @ObservedObject var settings: Settings
    @State var isSelectionViewLinkActive = false

    var body: some View {
        NavigationLink(destination: selectionView,
                       isActive: $isSelectionViewLinkActive,
                       label: {
                           HStack {
                               Text("Set of Numbers")
                               Spacer()
                               Text(settings.currentMapping?.name ?? "")
                                   .foregroundColor(.primary)
                           }
                       })
    }

    var selectionView: some View {
        Form {
            ForEach(settings.sortedMappings) { mapping in
                Button(action: {
                    mapping.useAsCurrentMapping()
                    self.isSelectionViewLinkActive = false
                }) {
                    HStack {
                        Text(mapping.wrappedName)
                        Spacer()
                        if mapping.isCurrentMapping {
                            Image(systemName: "checkmark")
                                .foregroundColor(.primary)
                        }
                    }
                    .contentShape(Rectangle())
                    .foregroundColor(.primary)
                }
            }
        }
    }
}

#if DEBUG
struct MappingPicker_Previews: PreviewProvider {
    static var previews: some View {
        MappingPicker(settings: PersistenceController.previewSettings)
    }
}
#endif
