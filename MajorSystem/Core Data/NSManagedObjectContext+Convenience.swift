//
//  ManagedObjectContext+Convenience.swift
//  MajorSystem
//
//  Created by Jochen on 10.12.20.
//

import Foundation
import CoreData

// MARK: General
extension NSManagedObjectContext {
    func fetchEntities<T: NSManagedObject>(ofType type: T.Type, predicate: NSPredicate? = nil) throws -> [T] {
        let entityName = String(describing: type)
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.predicate = predicate
        return try fetch(fetchRequest)
    }

    func fetchEntities<T: NSManagedObject>(ofType type: T.Type, predicate: NSPredicate? = nil, success: @escaping ([T]) -> ()) throws {
        let entityName = String(describing: type)
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        let asyncFetchRequest = NSAsynchronousFetchRequest<T>(fetchRequest: fetchRequest) { (result) in
            success(result.finalResult ?? [])
        }
        try execute(asyncFetchRequest)
    }
}

// MARK: Mapping
extension NSManagedObjectContext {
    @discardableResult
    func createMapping(withName name: String) -> Mapping {
        let mapping = Mapping(context: self)
        mapping.name = name
        return mapping
    }

    func fetchMapping(withName name: String) throws -> Mapping? {
        let predicate = NSPredicate(format: "name == %@", name)
        let results = try fetchEntities(ofType: Mapping.self, predicate: predicate)
        return results.first
    }

    func fetchOrCreateMapping(withName name: String) throws -> Mapping {
        if let mapping = try fetchMapping(withName: name) {
            return mapping
        }
        return createMapping(withName: name)
    }
}

// MARK: Numbers
extension NSManagedObjectContext {
    func fetchNumber(withValue value: Int32, numberOfDigits: Int16, inMappingWithName mapping: String) throws -> Number? {
        var subpredicates: [NSPredicate] = []
        subpredicates.append(NSPredicate(format: "mapping.name == %@", mapping))
        subpredicates.append(NSPredicate(format: "numberOfDigits == %d", numberOfDigits))
        subpredicates.append(NSPredicate(format: "value == %d", value))
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: subpredicates)
        let results = try fetchEntities(ofType: Number.self, predicate: predicate)
        return results.first
    }

    func fetchOrCreateNumber(withValue value: Int32, numberOfDigits: Int16, inMappingWithName mapping: String) throws -> Number {
        let mapping = try fetchOrCreateMapping(withName: mapping)
        return try mapping.fetchOrAddNumber(withValue: value, numberOfDigits: numberOfDigits, inContext: self)
    }
}
