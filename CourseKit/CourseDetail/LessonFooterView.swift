//
//  LessonFooterView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 16.06.2022.
//

import SwiftUI

struct LessonFooterView: View {
    var footer: LessonFooter = lessonFooter
    var settings: ViewAssets
    var body: some View {
        VStack(alignment: .center) {
            Text(footer.copyrightText)
                .font(Font.custom(settings.descriptionFont, size: 12))
                .foregroundColor(Color(settings.tertiaryTextColor))
                .multilineTextAlignment(.center)
                .frame(width: UIScreen.main.bounds.width/2,
                       alignment: .center)
            
            HStack {
                Button(
                    action: {
                        // do something
                    }, label: {
                        VStack(alignment: .leading) {
                            Image(footer.previousBottonImage)
                                .frame(width: 30, height: 30, alignment: .center)
                            Text(footer.priviousButtonText)
                                .font(Font.custom(settings.descriptionFont, size: 12))
                                .foregroundColor(Color(settings.primaryTextColor))
                        }
                        
                    }
                )
                
                Spacer()
                
                Button(
                    action: {
                        // do something
                    }, label: {
                        VStack(alignment: .trailing) {
                            Image(footer.nextButtonImage)
                                .frame(width: 30, height: 30, alignment: .center)
                            Text(footer.nextButtonText)
                                .font(Font.custom(settings.descriptionFont, size: 12))
                                .foregroundColor(Color(settings.primaryTextColor))
                                .padding(.trailing, 3)
                        }
                        
                    }
                )
            }
        }
    }
}
