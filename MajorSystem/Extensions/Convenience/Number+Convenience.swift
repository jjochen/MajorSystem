//
// Number+Convenience.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import Foundation
import SwiftUI

extension Number {
    var wrappedPossibleWords: Set<Word> {
        possibleWords as? Set<Word> ?? []
    }

    var numberOfPossibleWords: Int {
        wrappedPossibleWords.count
    }

    var isEmpty: Bool {
        wrappedPossibleWords.isEmpty
    }

    var sortedPossibleWords: [Word] {
        wrappedPossibleWords.sorted()
    }
}
