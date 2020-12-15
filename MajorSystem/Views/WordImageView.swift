//
//  WordImageView.swift
//  MajorSystem
//
//  Created by Jochen on 14.12.20.
//

import SwiftUI

struct WordImageView: View {
    var image: UIImage?

    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .scaledToFill()
        } else {
            Rectangle()
                .fill(Color.gray)
        }
    }
}

struct WordImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WordImageView()
            WordImageView(image: UIImage(systemName: "sun.dust.fill"))
        }
        .previewLayout(.fixed(width: 50, height: 50))
    }
}