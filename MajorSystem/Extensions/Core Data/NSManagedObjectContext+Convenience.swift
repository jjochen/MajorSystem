//
// NSManagedObjectContext+Convenience.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import CoreData
import Foundation

// MARK: General

extension NSManagedObjectContext {
    func fetchEntities<T: NSManagedObject>(ofType type: T.Type, predicate: NSPredicate? = nil) throws -> [T] {
        let entityName = String(describing: type)
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.predicate = predicate
        return try fetch(fetchRequest)
    }

    func fetchEntities<T: NSManagedObject>(ofType type: T.Type, predicate _: NSPredicate? = nil, success: @escaping ([T]) -> Void) throws {
        let entityName = String(describing: type)
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        let asyncFetchRequest = NSAsynchronousFetchRequest<T>(fetchRequest: fetchRequest) { result in
            success(result.finalResult ?? [])
        }
        try execute(asyncFetchRequest)
    }
}

// MARK: Settings

extension NSManagedObjectContext {
    func createSettings() -> Settings {
        Settings(context: self)
    }

    func fetchOrCreateSettings() throws -> Settings {
        let results = try fetchEntities(ofType: Settings.self)
        if let settings = results.first {
            return settings
        }
        return createSettings()
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
}
