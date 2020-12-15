//
//  Number+CoreData.swift
//  MajorSystem
//
//  Created by Jochen on 10.12.20.
//

import Foundation
import CoreData

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
}

private let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.allowsFloats = false
    return formatter
}()
