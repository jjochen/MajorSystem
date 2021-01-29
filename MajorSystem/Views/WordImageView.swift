//
// WordImageView.swift
// MajorSystem
//
// Copyright (c) 2020 Jochen Pfeiffer
//

import SwiftUI

struct WordImageView: View {
    var image: UIImage?
    var cornerRadius: CGFloat = 12

    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .cornerRadius(cornerRadius)
                .scaledToFill()
        } else {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 2, dash: [6]))
        }
    }
}

#if DEBUG
struct WordImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WordImageView()
            WordImageView(image: UIImage(systemName: "sun.dust.fill"))
        }
        .previewLayout(.fixed(width: 50, height: 50))
    }
}
#endif
