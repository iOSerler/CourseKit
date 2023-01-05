//
//  LessonRowView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import SwiftUI

@available(iOS 15.0, *)
struct LessonRowView: View {
    
    @ObservedObject var lessonViewModel: LessonViewModel
    @State var progress: Double = 0.0
    var settings: CourseAssets
    
    var icon: String {
        switch lessonViewModel.lesson.type {
        case "text":
            return "doc.richtext"
        case "article":
            return "doc.text"
        case "page":
            return "network"
        case "video":
            return "film"
        case "quiz", "test":
            return "puzzlepiece.extension"
        default:
            return ""
        }
    }
    
    var body: some View {
        
        HStack(alignment: .top) {
            VStack {
                Image(systemName: icon)
            }
            .frame(width: 20)
            .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text(lessonViewModel.lesson.title)
                    .font(.custom(settings.titleFont, size: 14))
                    .foregroundColor(Color(settings.primaryTextColor))
                if let description = lessonViewModel.lesson.description {
                    Text(description)
                        .font(.custom(settings.descriptionFont, size: 12))
                        .foregroundColor(Color(settings.secondaryTextColor))
                        .multilineTextAlignment(.leading)
                }
                
                HStack(alignment: .center) {
                    
                    ProgressView(value: self.progress * 100, total: 100)
                        .accentColor(Int((self.progress * 100).rounded()) != 100 ? Color(settings.primaryColor) : Color(settings.successPrimaryColor))
                        .padding(.trailing, 20)
                    
                    Text("\(Int((self.progress * 100).rounded())) %")
                        .font(.custom(settings.descriptionFont, size: 12))
                        .foregroundColor(Color(settings.primaryTextColor))
                        .padding(.trailing, 20)
                }
                
            }
            
            Spacer()
        }
        .onAppear {
            
                self.progress = lessonViewModel.getLessonProgress(userId: "nurios")
            
        }
    }
}
