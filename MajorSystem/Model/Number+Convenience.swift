//
//  Number+Convenience.swift
//  MajorSystem
//
//  Created by Jochen on 15.12.20.
//

import Foundation
import SwiftUI

extension Number {
    var displayString: String {
        numberFormatter.minimumIntegerDigits = Int(numberOfDigits)
        return numberFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }

    var mainWordValue: String {
        return mainWord?.value ?? ""
    }

    var image: WordImageView {
        return WordImageView(image: mainWord?.uiImage)
    }
}

private let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.allowsFloats = false
    return formatter
}()
