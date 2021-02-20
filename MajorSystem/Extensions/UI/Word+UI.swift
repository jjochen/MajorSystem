//
// Word+UI.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import SwiftUI

extension Word {
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
