//
//  VideoDescriptionView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 16.06.2022.
//

import SwiftUI

struct VideoDescriptionView: View {
    var settings: ViewAssets
    var title: String
    var duration: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(Font.custom(settings.titleFont, size: 18))
                .foregroundColor(Color(settings.primaryTextColor))
            
            HStack {
                Image(systemName: "timer")
                    .foregroundColor(Color(settings.primaryColor))
                Text(duration)
                    .font(Font.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.secondaryTextColor))
            }
            
            Text(description)
                .font(Font.custom(settings.descriptionFont, size: 14))
                .foregroundColor(Color(settings.secondaryTextColor))
        }
    }
}
