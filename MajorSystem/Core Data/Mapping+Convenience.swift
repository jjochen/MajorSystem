//
//  Mapping+Convenience.swift
//  MajorSystem
//
//  Created by Jochen on 10.12.20.
//

import Foundation
import CoreData

extension Mapping {
    @discardableResult
    func addNumber(withValue value: Int32, numberOfDigits: Int16, inContext context: NSManagedObjectContext) -> Number {
        let number = Number(context: context)
        number.numberOfDigits = numberOfDigits
        number.value = value
        addToNumbers(number)
        return number
    }

//    func number(withValue value: Int32, numberOfDigits: Int16, inContext context: NSManagedObjectContext) {
//        let fetchRequest: NSFetchRequest = Number.fetchRequest()
//        var error: NSError?
//        var results = context.execute(fetchRequest)
//        if let error = error {
//            println("Unresolved error \(error), \(error.userInfo)")
//            abort()
//        }
//    }

    func addAllNumbers(withNumberOfDigits numberOfDigits: Int16, inContext context: NSManagedObjectContext) {
        let maxValue = Int(pow(Double(10), Double(numberOfDigits)))
        for value in 0..<maxValue {
            addNumber(withValue: Int32(value), numberOfDigits: numberOfDigits, inContext: context)
        }
    }
}
