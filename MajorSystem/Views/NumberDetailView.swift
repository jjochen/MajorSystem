//
// NumberDetailView.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import SwiftUI

struct NumberDetailView: View {
    let number: Number

    #warning("initial value not set")
    @State private var selectedWord: Word? {
        didSet {
            number.mainWord = selectedWord
        }
    }

    var body: some View {
        List(selection: $selectedWord) {
            HStack {
                number.image
                    .frame(width: 70, height: 70)
                    .padding([.trailing, .vertical])
                Text(number.mainWordValue)
                    .font(.title)
            }
            Section(header: Text("Words")) {
                ForEach(number.sortedWords, id: \.self) { word in
                    Text(word.wrappedValue)
                }
            }
        }
        .environment(\.editMode, .constant(EditMode.active))
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
