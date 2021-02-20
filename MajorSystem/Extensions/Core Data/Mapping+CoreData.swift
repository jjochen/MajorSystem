//
// Mapping+CoreData.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import CoreData
import Foundation

extension Mapping {
    @discardableResult
    func addNumber(withValue value: Int32, numberOfDigits: Int16, inContext context: NSManagedObjectContext) -> Number {
        let number = Number(context: context)
        number.numberOfDigits = numberOfDigits
        number.value = value
        addToNumbers(number)
        return number
    }

    func number(withValue value: Int32, numberOfDigits: Int16, inContext context: NSManagedObjectContext) throws -> Number? {
        var subpredicates: [NSPredicate] = []
        subpredicates.append(NSPredicate(format: "mapping == %@", self))
        subpredicates.append(NSPredicate(format: "numberOfDigits == %d", numberOfDigits))
        subpredicates.append(NSPredicate(format: "value == %d", value))
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: subpredicates)
        let results = try context.fetchEntities(ofType: Number.self, predicate: predicate)
        return results.first
    }

    func fetchOrAddNumber(withValue value: Int32, numberOfDigits: Int16, inContext context: NSManagedObjectContext) throws -> Number {
        if let number = try number(withValue: value, numberOfDigits: numberOfDigits, inContext: context) {
            return number
        }
        return addNumber(withValue: value, numberOfDigits: numberOfDigits, inContext: context)
    }

    func addNumbers(withNumberOfDigits numberOfDigits: Int16, inContext context: NSManagedObjectContext) {
        let maxValue = Int(pow(Double(10), Double(numberOfDigits)))
        for value in 0 ..< maxValue {
            addNumber(withValue: Int32(value), numberOfDigits: numberOfDigits, inContext: context)
        }
    }

    func checkNumbers(withNumberOfDigits numberOfDigits: Int16, inContext context: NSManagedObjectContext) throws {
        let maxValue = Int(pow(Double(10), Double(numberOfDigits)))
        for value in 0 ..< maxValue {
            _ = try fetchOrAddNumber(withValue: Int32(value), numberOfDigits: numberOfDigits, inContext: context)
        }
    }
}
