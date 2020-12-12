//
//  Word+Convenience.swift
//  MajorSystem
//
//  Created by Jochen on 10.12.20.
//

import Foundation
import CoreData

extension Word {
    func useAsMainWord() {
        number?.mainWord = self
    }
}
