//
// NumberDetailView.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import SwiftUI

struct NumberDetailView: View {
    let number: Number

    var body: some View {
        VStack {
            HStack {
                Text(number.mainWordValue)
                    .font(.title)
                Spacer()
                number.image
                    .frame(width: 70, height: 70)
            }
            Spacer()
        }
        .padding(.all)
        .navigationTitle(number.displayString)
    }
}

#if DEBUG
struct NumberDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NumberDetailView(number: PersistenceController.previewNumber)
        }
    }
}
#endif
