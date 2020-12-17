//
// Number+Convenience.swift
// MajorSystem
//
// Copyright (c) 2020 Jochen Pfeiffer
// Created by Jochen on 17.12.20.
//

import Foundation
import SwiftUI

extension Number {
    var displayString: String {
        numberFormatter.minimumIntegerDigits = Int(numberOfDigits)
        return numberFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }

    var mainWordValue: String {
        mainWord?.value ?? ""
    }

    var image: WordImageView {
        WordImageView(image: mainWord?.uiImage)
    }

    var numberOfPossibleWords: Int {
        possibleWords?.count ?? 0
    }

    var hasWords: Bool {
        numberOfPossibleWords > 0
    }
}

private let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.allowsFloats = false
    return formatter
}()
