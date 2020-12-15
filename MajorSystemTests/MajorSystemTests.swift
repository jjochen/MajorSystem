//
//  MajorSystemTests.swift
//  MajorSystemTests
//
//  Created by Jochen on 04.12.20.
//

import XCTest
@testable import MajorSystem

class MajorSystemTests: XCTestCase {

    var persistenceController: PersistenceController!

    override func setUpWithError() throws {
        persistenceController = PersistenceController(inMemory: true)
    }

    override func tearDownWithError() throws {
        persistenceController = nil
    }

    func testMappingCreation() throws {
        let context = persistenceController.container.viewContext
        let mapping = context.createMapping(withName: "test")
        XCTAssertNotNil(mapping)
        try! context.save()
        let fetchResult = try! context.fetchMapping(withName: "test")
        XCTAssertEqual(mapping, fetchResult)
    }
}
