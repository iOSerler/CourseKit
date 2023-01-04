//
//  QuizAlertView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 29.06.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct QuizAlertView: View {
    var settings: CourseAssets
    @Binding var showAlert: Bool
    var body: some View {
        ZStack {
            Image(systemName: "rectangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color(uiColor: settings.buttonTextColor))
            VStack(alignment: .center, spacing: 20) {
                Text("Complete the course first")
                    .font(.custom(settings.titleFont, size: 19))
                    .foregroundColor(Color(settings.primaryTextColor))
                Group {
                    Text("You can not pass the quiz before you complete at least ")
                        .font(.custom(settings.descriptionFont, size: 15))
                        .foregroundColor(Color(settings.secondaryTextColor))
                    +
                    Text("80% of the course. ")
                        .font(.custom(settings.descriptionFont, size: 15))
                        .foregroundColor(Color(settings.primaryColor))
                    +
                    Text("Go back and learn a little more and come take quiz.")
                        .font(.custom(settings.descriptionFont, size: 15))
                        .foregroundColor(Color(settings.secondaryTextColor))
                }.multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                Button(
                    action: {
                        showAlert.toggle()
                    }, label: {
                        Text("Go Back to Course")
                            .font(Font.custom(settings.titleFont, size: 14))
                            .frame(width: UIScreen.main.bounds.height/2.5 - 60, height: 45, alignment: .center)
                            .background(Color(settings.primaryColor))
                            .accentColor(Color(settings.buttonTextColor))
                            .cornerRadius(UIScreen.main.bounds.width/35)
                            .padding(.bottom, UIScreen.main.bounds.height/30)
                    }
                )
                .padding(.bottom, 16)
                
            }
            .padding(.horizontal, UIScreen.main.bounds.width/10)
        }.frame(width: UIScreen.main.bounds.height/2.5, height: UIScreen.main.bounds.height/2.5, alignment: .center)
        
    }
}
