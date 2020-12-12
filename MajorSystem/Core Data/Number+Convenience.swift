//
//  Number+Convenience.swift
//  MajorSystem
//
//  Created by Jochen on 10.12.20.
//

import Foundation
import CoreData

extension Number {
    func addWord(withValue value: String, inContext context: NSManagedObjectContext) {
        let word = Word(context: context)
        word.value = value
        addToPossibleWords(word)
    }

    var displayString: String {
        numberFormatter.minimumIntegerDigits = Int(numberOfDigits)
        return numberFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}

private let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.allowsFloats = false
    return formatter
}()
