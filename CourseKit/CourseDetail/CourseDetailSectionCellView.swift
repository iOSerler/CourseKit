//
//  CourseDetailSectionCellView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import SwiftUI

struct CourseDetailSectionCellView: View {
    
    @ObservedObject var courseViewModel: CourseViewModel
    var settings: ViewAssets
    @State var section: CourseSection
    @Binding var showAlert: Bool
    @Binding var progress: Double
    
    var body: some View {

        HStack {
            VStack(alignment: .leading) {
                Text(section.title)
                    .font(.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.secondaryTextColor))
                
                ForEach(
                    courseViewModel.getLessonsBySection(
                        sectionId: section.id
                    )
                ) { lesson in
                    if lesson.type == "text" {
                        NavigationLink(destination: TextImageLessonView(courseViewModel: courseViewModel, settings: settings, textLesson: lesson)) {
                            CourseDetailTopicCellView(courseViewModel: courseViewModel, lesson: lesson, settings: settings)
                                .padding(.vertical, 10)
                        }
                    }
                    else if lesson.type == "video"{
                        NavigationLink(destination: VideoLessonView(courseViewModel: courseViewModel, settings: settings, videoLesson: lesson)) {
                            CourseDetailTopicCellView(courseViewModel: courseViewModel, lesson: lesson, settings: settings)
                                .padding(.vertical, 10)

                        }
                    }
                    else if lesson.type == "finalQuiz" {
                        NavigationLink(destination: QuizView(courseViewModel: courseViewModel, settings: settings, lesson: lesson)) {
                            CourseDetailTopicCellView(courseViewModel: courseViewModel, lesson: lesson, settings: settings)
                                .padding(.vertical, 10)

                        }.disabled(progress >= 0.8 ? false: true)
                            .onTapGesture {
                                if progress < 0.8 {
                                    showAlert.toggle()
                                }
                            }
                    }
                    else {
                        NavigationLink(destination: QuizView(courseViewModel: courseViewModel, settings: settings, lesson: lesson)) {
                            CourseDetailTopicCellView(courseViewModel: courseViewModel, lesson: lesson, settings: settings)
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
