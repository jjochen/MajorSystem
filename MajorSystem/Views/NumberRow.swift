//
// NumberRow.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import SwiftUI

struct NumberRow: View {
    @ObservedObject var number: Number

    var body: some View {
        HStack {
            Text(number.displayString)
                .font(.headline)
                .frame(minWidth: 50, alignment: .leading)
            Text(number.mainWordValue)

            Spacer()
            number.image
                .frame(width: 50, height: 50)
        }
    }
}

#if DEBUG
struct NumberRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NumberRow(number: PersistenceController.previewNumber)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
