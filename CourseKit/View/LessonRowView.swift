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
        
        HStack(alignment: .center) {
            VStack {
                Image(systemName: icon)
            }
            .frame(width: 20)
            .padding(.trailing, 8)
            
            Text(lessonViewModel.lesson.title)
            .font(.custom(settings.descriptionFont, size: 16))
            .foregroundColor(Color(settings.primaryTextColor))
            .multilineTextAlignment(.leading)
            
            Spacer()
            if self.progress > 0 {
                Text("\(Int((self.progress * 100).rounded()))%")
                    .font(.custom(settings.descriptionFont, size: 10))
                    .foregroundColor(Color(settings.primaryTextColor))
                    .frame(width: 25)
                    .padding(.trailing, 4)
            }
            
        }
        .onAppear {
            self.progress = lessonViewModel.getLessonProgress(userId: "nurios")
        }
    }
}
