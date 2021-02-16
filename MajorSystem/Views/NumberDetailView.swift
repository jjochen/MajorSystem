//
// NumberDetailView.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import SwiftUI

struct NumberDetailView: View {
    @ObservedObject var number: Number
    @State private var selectedWord: Word?

    init(number: Number) {
        self.number = number
        _selectedWord = State(initialValue: number.mainWord)
    }

    var body: some View {
        let selection = Binding(
            get: { self.selectedWord },
            set: { word in
                self.selectedWord = word
                self.number.mainWord = word
            }
        )

        return List(selection: selection) {
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
