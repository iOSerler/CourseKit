//
//  CourseView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import SwiftUI

struct CourseView: View {
    
    @ObservedObject var courseViewModel: CourseViewModel
    var settings: ViewAssets
    @State var progress: Double = 0.0
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    if let detail = courseViewModel.course {
                        Text(detail.title)
                            .font(.custom(settings.titleFont, size: 25))
                            .foregroundColor(Color(settings.primaryTextColor))
                        
                        Text(detail.longDescription)
                            .font(.custom(settings.descriptionFont, size: 14))
                            .foregroundColor(Color(settings.secondaryTextColor))
                            .padding(.top, 20)
                        
                        HStack {
                            Image(systemName: "person")
                            Text(detail.author)
                                .font(.custom(settings.descriptionFont, size: 14))
                                .foregroundColor(Color(settings.secondaryTextColor))
                            
                            Image(systemName: "timer")
                                .padding(.leading, 20)
                            Text(detail.duration)
                                .font(.custom(settings.descriptionFont, size: 14))
                                .foregroundColor(Color(settings.secondaryTextColor))
                            
                            Spacer()
                        }
                        .padding(.top, 20)
                        
                        HStack(alignment: .center) {
                            
                            ProgressView(value: self.progress * 100, total: 100)
                                .accentColor(self.progress != 1 ? Color(settings.primaryColor) : Color(.green))
                                .padding(.trailing, 20)
                            
                            Text("\(Int((self.progress * 100).rounded())) %")
                                .font(.custom(settings.descriptionFont, size: 12))
                                .foregroundColor(Color(settings.primaryTextColor))
                                .padding(.trailing, 20)
                        }
                        
                        
                        ForEach(detail.sections) { section in
                            CourseDetailSectionCellView(courseViewModel: courseViewModel, settings: settings, section: section, showAlert: $showAlert, progress: $progress)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 50)
                .padding(.bottom, 50)
  
            }
            .onDidAppear {
                self.progress = courseViewModel.saveCourseProgress(userId: 1)
                //            self.progress = coursesViewModel.getCourseProgress(userId: 1, courseId: self.course.id)
            }
            
            // FIXME: that's too ugly!
            VStack {
                Spacer()
                if self.progress > 0.9 {
                    NavigationLink(destination: CompleteCourseView(settings: settings, courseTitle: courseViewModel.course.title, completionRate: (self.progress * 500).rounded()/100, numPoints: 15), label: {
                        Text("See Stats")
                            .font(.custom(settings.titleFont, size: 14))
                            .foregroundColor(Color(settings.buttonTextColor))

                    })
                    .frame(width: UIScreen.main.bounds.width / 1.8, height: 50)
                    .background(Color(settings.primaryColor))
                    .cornerRadius(25)
                    .shadow(color: Color(settings.primaryColor), radius: 5)
                } else {
                    
                    switch courseViewModel.getFirstUnfinishedLesson(for: 1).type {
                    case "text":
                        NavigationLink(destination:  TextImageLessonView(courseViewModel: courseViewModel, settings: settings, textLesson: courseViewModel.getFirstUnfinishedLesson(for: 1)), label: {
                            Text("Continue")
                                .font(.custom(settings.titleFont, size: 14))
                                .foregroundColor(Color(settings.buttonTextColor))
                            Image(systemName: "play.fill")
                                .padding(.leading, 10)
                                .foregroundColor(Color(settings.buttonTextColor))
                           
                       })
                        .frame(width: UIScreen.main.bounds.width / 1.8, height: 50)
                        .background(Color(settings.primaryColor))
                        .cornerRadius(25)
                        .shadow(color: Color(settings.primaryColor), radius: 5)
                    case "video":
                        NavigationLink(destination:  VideoLessonView(courseViewModel: courseViewModel, settings: settings, videoLesson: courseViewModel.getFirstUnfinishedLesson(for: 1)), label: {
                            Text("Continue")
                                .font(.custom(settings.titleFont, size: 14))
                                .foregroundColor(Color(settings.buttonTextColor))
                            Image(systemName: "play.fill")
                                .padding(.leading, 10)
                                .foregroundColor(Color(settings.buttonTextColor))
                           
                       })
                        .frame(width: UIScreen.main.bounds.width / 1.8, height: 50)
                        .background(Color(settings.primaryColor))
                        .cornerRadius(25)
                        .shadow(color: Color(settings.primaryColor), radius: 5)
                    case "finalQuiz", "quiz":
                        NavigationLink(destination:  QuizView(courseViewModel: courseViewModel, settings: settings, lesson: courseViewModel.getFirstUnfinishedLesson(for: 1)), label: {
                            Text("Continue")
                                .font(.custom(settings.titleFont, size: 14))
                                .foregroundColor(Color(settings.buttonTextColor))
                            Image(systemName: "play.fill")
                                .padding(.leading, 10)
                                .foregroundColor(Color(settings.buttonTextColor))
                           
                       })
                        .frame(width: UIScreen.main.bounds.width / 1.8, height: 50)
                        .background(Color(settings.primaryColor))
                        .cornerRadius(25)
                        .shadow(color: Color(settings.primaryColor), radius: 5)
                    default:
                        Text("")
                    }

                }
            }

            if showAlert {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                        .background(Color(uiColor: .systemBackground))
                        .opacity(0.3)
                    QuizAlertView(settings: settings, showAlert: $showAlert)
                }
                .ignoresSafeArea()
            }
        }
    }
    
    
    
    
}
