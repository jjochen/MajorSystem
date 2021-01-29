//
// WordConvenienceTests.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import CoreData
@testable import MajorSystem
import XCTest

class WordConvenienceTests: XCTestCase {
    var context: NSManagedObjectContext!

    override func setUpWithError() throws {
        let persistenceController = PersistenceController(inMemory: true)
        context = persistenceController.container.viewContext
    }

    override func tearDownWithError() throws {
        context = nil
    }

    func testSetAsMainWord() throws {
        let number = Number(context: context)
        let word1 = number.addWord(withValue: "word 1", inContext: context)
        let word2 = number.addWord(withValue: "word 2", inContext: context)

        XCTAssertEqual(number.mainWord, word1)
        word2.setAsMainWord()
        XCTAssertEqual(number.mainWord, word2)
    }

    func testWordUIImage() throws {
        let image = UIImage(systemName: "trash")
        let word = Word(context: context)
        word.uiImage = image
        try context.save()
        let fetchResult = try context.fetchEntities(ofType: Word.self).first

        XCTAssertEqual(word, fetchResult)
        let fetchedImage = fetchResult?.uiImage
        XCTAssertNotNil(fetchedImage)
    }
}
