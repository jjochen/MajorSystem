//
// Mapping+Compareable.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import Foundation

extension Mapping: Comparable {
    public static func < (lhs: Mapping, rhs: Mapping) -> Bool {
        lhs.wrappedName < rhs.wrappedName
    }
}
