//
// Number+CoreData.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import CoreData
import Foundation

extension Number {
    @discardableResult
    func addWord(withValue value: String, inContext context: NSManagedObjectContext) -> Word {
        let useAsMain = isEmpty
        return addWord(withValue: value, useAsMain: useAsMain, inContext: context)
    }

    @discardableResult
    func addWord(withValue value: String, useAsMain: Bool, inContext context: NSManagedObjectContext) -> Word {
        let word = Word(context: context)
        word.value = value
        addToPossibleWords(word)
        if useAsMain {
            mainWord = word
        }
        return word
    }
}
