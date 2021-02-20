//
// Settings+CoreData.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import CoreData

// MARK: Mapping

extension Settings {
    @discardableResult
    func addMapping(withName name: String, inContext context: NSManagedObjectContext) -> Mapping {
        let useAsCurrent = isEmpty
        return addMapping(withName: name, useAsCurrent: useAsCurrent, inContext: context)
    }

    @discardableResult
    func addMapping(withName name: String, useAsCurrent: Bool, inContext context: NSManagedObjectContext) -> Mapping {
        let mapping = Mapping(context: context)
        mapping.name = name
        addToMappings(mapping)
        if useAsCurrent {
            currentMapping = mapping
        }
        return mapping
    }

    func currentOrDefaultMapping(inContext context: NSManagedObjectContext) throws -> Mapping {
        if let mapping = currentMapping {
            return mapping
        }

        if let mapping = wrappedMappings.first {
            currentMapping = mapping
            return mapping
        }

        let mapping = addMapping(withName: "default", inContext: context)
        try mapping.checkNumbers(withNumberOfDigits: 1, inContext: context)
        try mapping.checkNumbers(withNumberOfDigits: 2, inContext: context)
        return mapping
    }

//    func fetchMapping(withName name: String) throws -> Mapping? {
//        let predicate = NSPredicate(format: "name == %@", name)
//        let results = try fetchEntities(ofType: Mapping.self, predicate: predicate)
//        return results.first
//    }
//
//    func fetchOrCreateMapping(withName name: String) throws -> Mapping {
//        if let mapping = try fetchMapping(withName: name) {
//            return mapping
//        }
//        return createMapping(withName: name)
//    }
}
