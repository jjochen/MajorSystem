//
// Settings+Convenience.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import Foundation

extension Settings {
    var wrappedMappings: Set<Mapping> {
        mappings as? Set<Mapping> ?? []
    }

    var numberOfMappings: Int {
        wrappedMappings.count
    }

    var isEmpty: Bool {
        wrappedMappings.isEmpty
    }

    var sortedMappings: [Mapping] {
        wrappedMappings.sorted()
    }
}
