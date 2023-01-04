//
//  NotificationCellView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import SwiftUI

struct NotificationCellView: View {
    var settings: CourseAssets
    var item: NewsItem
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                item.image != nil  ?
                Image(systemName: item.image!)
                    .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.width / 8) :
                Image("Logo")
                    .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.width / 8)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(item.title)
                            .font(.custom(settings.titleFont, size: 14))
                            .foregroundColor(Color(settings.primaryTextColor))
                        Spacer()
                        Text(item.time)
                            .font(.custom(settings.descriptionFont, size: 12))
                            .foregroundColor(Color(settings.secondaryColor))
                            .padding(.leading, 5)
                    }
            
                    Text(item.description)
                        .font(.custom(settings.descriptionFont, size: 12))
                        .foregroundColor(Color(settings.secondaryTextColor))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                }
                .frame(height: 60)
                .padding(.leading, 10)
                
            }
            .padding(.horizontal, 20)
            .frame(height: 100)
            
        }
    }
}
