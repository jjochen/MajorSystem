//
// WordRow.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import SwiftUI

struct WordRow: View {
    @ObservedObject var word: Word

    var body: some View {
        HStack {
            word.image
                .frame(width: 50, height: 50)
                .padding([.trailing])
            Text(word.wrappedValue)
                .font(.headline)
            Spacer()
            if word.isMainWord {
                Image(systemName: "checkmark")
                    .foregroundColor(.primary)
            }
        }
    }
}

#if DEBUG
struct WordRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WordRow(word: PersistenceController.previewWord)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
