//
// Word+Convenience.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import Foundation
import SwiftUI

extension Word {
    var wrappedValue: String {
        value ?? ""
    }

    var isMainWord: Bool {
        number?.mainWord == self
    }

    func useAsMainWord() {
        number?.mainWord = self
    }
}
