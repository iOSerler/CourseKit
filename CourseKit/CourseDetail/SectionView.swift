//
//  SectionView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import SwiftUI

@available(iOS 15.0, *)
struct SectionView: View {
    
    @ObservedObject var courseViewModel: CourseViewModel
    var settings: CourseAssets
    var callbackDict: [String: ((LessonViewModel)->Void)]

    @State var section: CourseSection
    @Binding var showAlert: Bool
//    @Binding var progress: Double
    
    var body: some View {

        HStack {
            VStack(alignment: .leading) {
                
                Text(section.title)
                    .font(.custom(settings.titleFont, size: 20))
                    .foregroundColor(Color(settings.primaryTextColor))
                    .padding(.top, 10)
                
                Text(section.description)
                    .font(.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.secondaryTextColor))
                    .padding(.top, 1)
                    .padding(.bottom, 8)

                
                ForEach(section.lessons) { lesson in
                    
                    // FIXME: switch all navigation to a separate class
                    
                    let lessonVM = LessonViewModel(lesson: lesson, storage: courseViewModel.storage)

                    if lesson.type == "text" {

                        NavigationLink(destination: TextImageLessonView(lessonViewModel: lessonVM, settings: settings)) {
                            LessonRowView(lessonViewModel: lessonVM, settings: settings)
                                .padding(.vertical, 10)
                        }
                    } else if lesson.type == "video" {

                        NavigationLink(destination: VideoLessonView(lessonViewModel: lessonVM, settings: settings)) {
                            LessonRowView(lessonViewModel: lessonVM, settings: settings)
                                .padding(.vertical, 10)

                        }
                    } else if lesson.type == "quiz" {

                        NavigationLink(destination: QuizView(lessonViewModel: lessonVM, settings: settings)) {
                            LessonRowView(lessonViewModel: lessonVM, settings: settings)
                                .padding(.vertical, 10)

                        }
//                        .disabled(progress >= 0.8 ? false: true)
//                            .onTapGesture {
//                                if progress < 0.8 {
//                                    showAlert.toggle()
//                                }
//                        }
                    } else {
                        Button {
                            callbackDict[lessonVM.lesson.type]?(lessonVM)
                        } label: {
                            LessonRowView(lessonViewModel: lessonVM, settings: settings)
                                .padding(.vertical, 10)
                        }
                    }
                    Divider()
                }
                
            }
            
            Spacer()
        }
    }
}
