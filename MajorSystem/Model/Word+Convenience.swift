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
        isMainWordOfNumber != nil
    }

    func useAsMainWord() {
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

    var image: WordImageView {
        WordImageView(image: uiImage)
    }
}
