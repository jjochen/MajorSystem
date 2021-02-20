//
// Number+Compareable.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import Foundation

extension Number: Comparable {
    public static func < (lhs: Number, rhs: Number) -> Bool {
        if lhs.numberOfDigits < rhs.numberOfDigits {
            return true
        }

        if lhs.numberOfDigits > rhs.numberOfDigits {
            return false
        }

        return lhs.value < rhs.value
    }
}
