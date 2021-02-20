//
// Number+UI.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import Foundation

extension Number {
    var displayString: String {
        formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }

    var mainWordValue: String {
        mainWord?.value ?? ""
    }

    var image: WordImageView {
        WordImageView(image: mainWord?.uiImage)
    }
}

extension Number {
    private var formatter: NumberFormatter {
        let formatter = Number.formatter
        formatter.minimumIntegerDigits = Int(numberOfDigits)
        return formatter
    }

    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false
        return formatter
    }()
}
