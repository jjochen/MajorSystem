//
// NumberRow.swift
// MajorSystem
//
// Copyright (c) 2020 Jochen Pfeiffer
//

import SwiftUI

struct NumberRow: View {
    var number: Number

    var body: some View {
        HStack {
            Text(number.displayString)
            Spacer()
            Text(number.mainWordValue)
            number.image
                .cornerRadius(6)
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
