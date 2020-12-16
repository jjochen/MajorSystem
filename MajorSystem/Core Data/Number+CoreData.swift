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
    func addWord(withValue value: String, inContext context: NSManagedObjectContext) -> Word {
        let useAsMain = !hasWords
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
