//
//  TextImage.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/16/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct TextImageView: View {
    var settings: CourseAssets
    var textImage: TextLessonData
    
    var body: some View {
        VStack(alignment: .leading) {
            if let text = textImage.text {
                Text(text)
                    .font(.custom(settings.descriptionFont, size: 16))
                    .foregroundColor(Color(settings.primaryTextColor))
                    .padding(.horizontal, 0)
                    .multilineTextAlignment(.leading)
            }
            if let image = textImage.image {
                UrlImageView(urlString: image)
//                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
