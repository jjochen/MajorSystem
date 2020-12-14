//
//  NumberRow.swift
//  MajorSystem
//
//  Created by Jochen on 14.12.20.
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

struct NumberRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NumberRow(number: previewNumber)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }

    static var previewNumber: Number {
        let context = PersistenceController.preview.container.viewContext
        let number = try! context.fetchOrCreateNumber(withValue: 9, numberOfDigits: 2, inMappingWithName: "preview")
        return number
    }
}
