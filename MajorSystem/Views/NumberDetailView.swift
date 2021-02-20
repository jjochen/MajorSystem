//
// NumberDetailView.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import SwiftUI

struct NumberDetailView: View {
    @ObservedObject var number: Number

    var body: some View {
        List(selection: $number.mainWordSelection) {
            HStack {
                number.image
                    .frame(width: 70, height: 70)
                    .padding([.trailing, .vertical])
                Text(number.mainWordValue)
                    .font(.title)
            }
            Section(header: Text("Words")) {
                ForEach(number.sortedPossibleWords, id: \.self) { word in
                    WordRow(word: word)
                }
            }
        }
        .environment(\.editMode, .constant(EditMode.active))
        .navigationTitle(number.displayString)
    }
}

private extension Number {
    var mainWordSelection: Word? {
        get {
            mainWord
        }
        set {
            objectWillChange.send()
            if newValue != nil {
                mainWord = newValue
            }
        }
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
