//
//  NumberConvenienceTests.swift
//  MajorSystemTests
//
//  Created by Jochen on 16.12.20.
//

import XCTest
import CoreData
@testable import MajorSystem


class NumberConvenienceTests: XCTestCase {

    var context: NSManagedObjectContext!

    override func setUpWithError() throws {
        let persistenceController = PersistenceController(inMemory: true)
        context = persistenceController.container.viewContext
    }

    override func tearDownWithError() throws {
        context = nil
    }

    func testNumberDisplayString() throws {
        let value: Int32 = 42
        let numberOfDigits: Int16 = 3
        let number = Number(context: context)
        number.value = value
        number.numberOfDigits = numberOfDigits

        XCTAssertEqual(number.displayString, "042")
    }

    func testNumberMainWordValue() throws {
        let number = Number(context: context)
        number.addWord(withValue: "word 1", inContext: context)
        number.addWord(withValue: "main word", useAsMain: true, inContext: context)
        number.addWord(withValue: "word 3", inContext: context)

        XCTAssertEqual(number.mainWordValue, "main word")
    }

    func testNumberHasWords() throws {
        let number = Number(context: context)

        XCTAssertFalse(number.hasWords)

        number.addWord(withValue: "word 1", inContext: context)

        XCTAssert(number.hasWords)
    }
}
