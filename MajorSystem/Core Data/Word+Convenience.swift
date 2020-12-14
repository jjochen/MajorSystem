//
//  Word+Convenience.swift
//  MajorSystem
//
//  Created by Jochen on 10.12.20.
//

import Foundation
import CoreData
import SwiftUI

extension Word {
    func useAsMainWord() {
        number?.mainWord = self
    }

    var image: UIImage? {
        guard let data = imageData else {
            return nil
        }
        return UIImage(data: data)
    }
}
