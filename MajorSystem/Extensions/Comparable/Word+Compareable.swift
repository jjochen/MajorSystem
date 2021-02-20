//
// Word+Compareable.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import Foundation

extension Word: Comparable {
    public static func < (lhs: Word, rhs: Word) -> Bool {
        lhs.wrappedValue < rhs.wrappedValue
    }
}
