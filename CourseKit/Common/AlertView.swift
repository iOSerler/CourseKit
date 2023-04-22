//
//  QuizAlertView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 29.06.2022.
//

import SwiftUI

/// use the view in the following way:
///
/// if showAlert {
///     Rectangle()
///         .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
///         .background(Color(uiColor: .systemBackground))
///         .opacity(0.3)
///     AlertView(title: "Salam!", description: "Learning is the key to doing things correctly", buttonTitle: "Got it", settings: settings, showAlert: $showAlert)
///         .ignoresSafeArea()
/// }

@available(iOS 15.0, *)
struct AlertView: View {
    
    let title: String
    let description: String
    let buttonTitle: String
    
    var settings: CourseAssets
    @Binding var showAlert: Bool
    
    var body: some View {
        ZStack {
            Image(systemName: "rectangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color(uiColor: settings.buttonTextColor))
            VStack(alignment: .center, spacing: 20) {
                Text(title)
                    .font(.custom(settings.titleFont, size: 19))
                    .foregroundColor(Color(settings.primaryTextColor))
                Text(description)
                    .font(.custom(settings.descriptionFont, size: 15))
                    .foregroundColor(Color(settings.secondaryTextColor))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                Button(
                    action: {
                        showAlert.toggle()
                    }, label: {
                        Text(buttonTitle)
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
        }
        .padding(.horizontal, UIScreen.main.bounds.width/10)
        
    }
}
