//
//  ContinueButton.swift
//  CourseKit
//
//  Created by Nursultan Askarbekuly on 22.04.2023.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContinueButton: View {
    
    let settings: CourseAssets
    
    var body: some View {
        HStack {
            Text("Continue")
                .font(.custom(settings.titleFont, size: 14))
                .foregroundColor(Color(settings.buttonTextColor))
            Image(systemName: "play.fill")
                .padding(.leading, 10)
                .foregroundColor(Color(settings.buttonTextColor))
        }.frame(width: UIScreen.main.bounds.width / 1.8, height: 50)
            .background(Color(settings.primaryColor))
            .cornerRadius(25)
            .shadow(color: Color(settings.primaryColor), radius: 5)
    }
}
