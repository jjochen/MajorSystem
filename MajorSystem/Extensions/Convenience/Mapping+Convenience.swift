//
// Mapping+Convenience.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import Foundation

extension Mapping {
    var wrappedName: String {
        name ?? ""
    }

    var wrappedNumbers: Set<Number> {
        numbers as? Set<Number> ?? []
    }

    var numberOfNumbers: Int {
        wrappedNumbers.count
    }

    var isEmpty: Bool {
        wrappedNumbers.isEmpty
    }

    var sortedNumbers: [Number] {
        wrappedNumbers.sorted()
    }

    func useAsCurrentMapping() {
        settings?.currentMapping = self
    }

    var isCurrentMapping: Bool {
        settings?.currentMapping == self
    }
}
