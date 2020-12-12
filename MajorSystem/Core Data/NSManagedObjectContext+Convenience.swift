//
//  ManagedObjectContext+Convenience.swift
//  MajorSystem
//
//  Created by Jochen on 10.12.20.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    @discardableResult
    func createMapping(withName name: String) -> Mapping {
        let mapping = Mapping(context: self)
        mapping.name = "preview"
        return mapping
    }
}
