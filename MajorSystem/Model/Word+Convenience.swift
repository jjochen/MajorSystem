//
// Word+Convenience.swift
// MajorSystem
//
// Copyright (c) 2020 Jochen Pfeiffer
// Created by Jochen on 17.12.20.
//

import Foundation
import SwiftUI

extension Word {
    func setAsMainWord() {
        number?.mainWord = self
    }

    var uiImage: UIImage? {
        get {
            guard let data = imageData else {
                return nil
            }
            return UIImage(data: data)
        }
        set(image) {
            imageData = image?.pngData()
        }
    }
}
