//
// CoreDataTests.swift
// MajorSystem
//
// Copyright (c) 2020 Jochen Pfeiffer
//

import CoreData
@testable import MajorSystem
import XCTest

class MajorSystemTests: XCTestCase {
    var context: NSManagedObjectContext!

    override func setUpWithError() throws {
        let persistenceController = PersistenceController(inMemory: true)
        context = persistenceController.container.viewContext
    }

    override func tearDownWithError() throws {
        context = nil
    }

    func testMappingCreate() throws {
        let name = "testghjkl5432%$#@"

        var fetchResult = try context.fetchMapping(withName: name)
        XCTAssertNil(fetchResult)

        let mapping = context.createMapping(withName: name)
        try! context.save()
        XCTAssertNotNil(mapping)

        fetchResult = try context.fetchMapping(withName: name)
        XCTAssertEqual(mapping, fetchResult)
    }

    func testMappingFetchOrCreate() throws {
        let name = "testitest"

        let mapping = try context.fetchOrCreateMapping(withName: name)
        try! context.save()
        XCTAssertNotNil(mapping)

        let fetchResult = try context.fetchOrCreateMapping(withName: name)
        XCTAssertEqual(mapping, fetchResult)
    }

    func testNumberAddToMapping() throws {
        let mappingName = "mapping"
        let value: Int32 = 42
        let numberOfDigits: Int16 = 3
        let mapping = context.createMapping(withName: mappingName)
        let number = mapping.addNumber(withValue: value, numberOfDigits: numberOfDigits, inContext: context)
        XCTAssertNotNil(number)

        let fetchResult = try context.fetchNumber(withValue: value, numberOfDigits: numberOfDigits, inMappingWithName: mappingName)
        XCTAssertEqual(number, fetchResult)
    }

    func testNumberAddAllToMapping() throws {
        let mappingName = "mapping"
        let numberOfDigits: Int16 = 3
        let mapping = context.createMapping(withName: mappingName)
        mapping.addAllNumbers(withNumberOfDigits: numberOfDigits, inContext: context)

        let fetchResults = try context.fetchEntities(ofType: Number.self)
        XCTAssertEqual(1000, fetchResults.count)
    }

    func testNumberFetchOrAddToMapping() throws {
        let mappingName = "mapping"
        let value: Int32 = 42
        let numberOfDigits: Int16 = 3
        let mapping = context.createMapping(withName: mappingName)
        let number = try mapping.fetchOrAddNumber(withValue: value, numberOfDigits: numberOfDigits, inContext: context)
        XCTAssertNotNil(number)

        let fetchResult = try mapping.fetchOrAddNumber(withValue: value, numberOfDigits: numberOfDigits, inContext: context)
        XCTAssertEqual(number, fetchResult)
    }

    func testNumberFetchOrCreate() throws {
        let mappingName = "mapping"
        let value: Int32 = 42
        let numberOfDigits: Int16 = 3
        let number = try context.fetchOrCreateNumber(withValue: value, numberOfDigits: numberOfDigits, inMappingWithName: mappingName)
        XCTAssertNotNil(number)

        let fetchResult = try context.fetchOrCreateNumber(withValue: value, numberOfDigits: numberOfDigits, inMappingWithName: mappingName)
        XCTAssertEqual(number, fetchResult)
    }
}
