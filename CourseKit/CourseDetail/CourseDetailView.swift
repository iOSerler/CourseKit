//
//  CourseDetailView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import SwiftUI

struct CourseDetailView: View {
    
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
                            .font(.custom(settings.titleFont, size: 20))
                            .foregroundColor(Color(settings.primaryTextColor))
                        
                        Text(detail.longDescription)
                            .font(.custom(settings.descriptionFont, size: 14))
                            .foregroundColor(Color(settings.secondaryTextColor))
                            .padding(.top, 20)
                        
                        HStack {
                            Image("author")
                            Text(detail.author)
                                .font(.custom(settings.descriptionFont, size: 14))
                                .foregroundColor(Color(settings.secondaryTextColor))
                            
                            Image("time-past")
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
                        
                        
                        Text("Lessons & Topics")
                            .font(.custom(settings.titleFont, size: 20))
                            .foregroundColor(Color(settings.primaryTextColor))
                            .padding(.top, 30)
                        ForEach(detail.sections) { section in
                            CourseDetailSectionCellView(courseViewModel: courseViewModel, settings: settings, section: section, showAlert: $showAlert, progress: $progress)
                        }
                        
                        
                        self.progress > 0.9 ?
                        NavigationLink(destination: CompleteCourseView(settings: settings, courseTitle: courseViewModel.course.title, completionRate: (self.progress * 500).rounded()/100, numPoints: 15), label: {
                            Text("Finish Course")
                                .font(Font.custom(settings.titleFont, size: 16))
                                .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                                .background(Color(settings.primaryColor))
                                .accentColor(Color(settings.buttonTextColor))
                                .cornerRadius(UIScreen.main.bounds.width/35)
                                .padding(.leading, UIScreen.main.bounds.width/40)
                            
                        }) : nil
                        
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
            
            VStack {
                Spacer()
                Button {
                    print("sgfdfg")
                } label: {
                    Text("Continue")
                        .font(.custom(settings.titleFont, size: 14))
                        .foregroundColor(Color(settings.buttonTextColor))
                    Image(systemName: "play.fill")
                        .padding(.leading, 10)
                        .foregroundColor(Color(settings.buttonTextColor))
                }
                .frame(width: UIScreen.main.bounds.width / 1.8, height: 40)
                .background(Color(settings.primaryColor))
                .cornerRadius(25)
                .shadow(color: Color(settings.primaryColor), radius: 10)
            }
            
            if showAlert {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                        .background(.black)
                        .opacity(0.3)
                    QuizAlertView(settings: settings, showAlert: $showAlert)
                }
                .ignoresSafeArea()
            }
        }
    }
    
    
}
