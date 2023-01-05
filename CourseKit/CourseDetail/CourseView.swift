//
//  CourseView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import SwiftUI

@available(iOS 15.0, *)
public struct CourseView: View {
    
    @ObservedObject var courseViewModel: CourseViewModel
    var settings: CourseAssets
    var callbackDict: [String: ((LessonViewModel)->Void)]
//    @State var progress: Double = 0.0
    @State var showAlert: Bool = false //FIXME: in what cases do we actually need to show it?
    
    public init(courseViewModel: CourseViewModel, settings: CourseAssets, callbackDict: [String: ((LessonViewModel)->Void)]) {
        self.courseViewModel = courseViewModel
        self.settings = settings
        self.callbackDict = callbackDict
    }
    
    public var body: some View {
        ZStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    if let detail = courseViewModel.course {
                        Text(detail.title)
                            .font(.custom(settings.titleFont, size: 31))
                            .foregroundColor(Color(settings.primaryTextColor))
                        
//                        HStack {
//                            Image(systemName: "person")
//                            Text(detail.author)
//                                .font(.custom(settings.descriptionFont, size: 14))
//                                .foregroundColor(Color(settings.secondaryTextColor))
//                            
//                            Image(systemName: "timer")
//                                .padding(.leading, 20)
//                            Text(detail.duration)
//                                .font(.custom(settings.descriptionFont, size: 14))
//                                .foregroundColor(Color(settings.secondaryTextColor))
//                            
//                            Spacer()
//                        }
//                        .padding(.top, 8)
                        
//                        HStack(alignment: .center) {
//
//                            ProgressView(value: self.progress * 100, total: 100)
//                                .accentColor(self.progress != 1 ? Color(settings.primaryColor) : Color(.green))
//                                .padding(.trailing, 20)
//
//                            Text("\(Int((self.progress * 100).rounded())) %")
//                                .font(.custom(settings.descriptionFont, size: 12))
//                                .foregroundColor(Color(settings.primaryTextColor))
//                                .padding(.trailing, 20)
//                        }
                        
//                        Text(detail.longDescription)
//                            .font(.custom(settings.descriptionFont, size: 14))
//                            .foregroundColor(Color(settings.secondaryTextColor))
//                            .padding(.top, 4)
                        
                        
                        ForEach(detail.sections) { section in
                            SectionView(
                                courseViewModel: courseViewModel,
                                settings: settings,
                                callbackDict: callbackDict,
                                section: section,
                                showAlert: $showAlert
//                                progress: $progress
                            )
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 50)
  
            }
//            .onDidAppear {
//                self.progress = courseViewModel.saveCourseProgress(userId: "nurios")
//            }
            
            // FIXME: that's too ugly!
//            VStack {
//                Spacer()
//                if self.progress > 0.9 {
//                    NavigationLink(destination: CompleteCourseView(settings: settings, courseTitle: courseViewModel.course.title, completionRate: (self.progress * 500).rounded()/100, numPoints: 15), label: {
//                        ContinueButton(settings: settings)
//
//                    })
//                } else {
//
//                    let lessonVM = courseViewModel.getFirstUnfinishedLesson(for: 1)
//
//                    switch lessonVM.lesson.type {
//                    case "text":
//                        NavigationLink(destination:  TextImageLessonView(lessonViewModel: lessonVM, settings: settings), label: {
//                            ContinueButton(settings: settings)
//                       })
//
//                    case "video":
//                        NavigationLink(destination:  VideoLessonView(lessonViewModel: lessonVM, settings: settings), label: {
//                            ContinueButton(settings: settings)
//                       })
//
//                    case "quiz":
//                        NavigationLink(destination:  QuizView(lessonViewModel: lessonVM, settings: settings), label: {
//                            ContinueButton(settings: settings)
//                        })
//
//                    default:
//                        Button {
//                            callbackDict[lessonVM.lesson.type]?(lessonVM)
//                        } label: {
//                            ContinueButton(settings: settings)
//                        }
//
//                    }
//
//                }
//            }

//            if showAlert {
//                ZStack {
//                    Rectangle()
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
//                        .background(Color(uiColor: .systemBackground))
//                        .opacity(0.3)
//                    QuizAlertView(settings: settings, showAlert: $showAlert)
//                }
//                .ignoresSafeArea()
//            }
        }
    }
}

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
