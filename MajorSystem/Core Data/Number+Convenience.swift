//
//  Number+Convenience.swift
//  MajorSystem
//
//  Created by Jochen on 10.12.20.
//

import Foundation
import CoreData
import SwiftUI

extension Number {
    @discardableResult
    func addWord(withValue value: String, useAsMain: Bool = false, inContext context: NSManagedObjectContext) -> Word {
        let word = Word(context: context)
        word.value = value
        addToPossibleWords(word)
        if useAsMain {
            mainWord = word
        }
        return word
    }

    var displayString: String {
        numberFormatter.minimumIntegerDigits = Int(numberOfDigits)
        return numberFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }

    var mainWordValue: String {
        return mainWord?.value ?? ""
    }

    var image: WordImageView {
        return WordImageView(image: mainWord?.image)
    }
}

private let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.allowsFloats = false
    return formatter
}()
