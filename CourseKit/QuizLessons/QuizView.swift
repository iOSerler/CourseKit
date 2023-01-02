//
//  QuizView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/28/22.
//

import SwiftUI

struct QuizView: View {
    
    @ObservedObject var courseViewModel: CourseViewModel
    var settings: ViewAssets
    var lesson: Lesson
    var courseProgress: Double = 0.0
    var body: some View {
        
        VStack(spacing: 30) {
            
            Text(lesson.quizData!.title)
                .multilineTextAlignment(.leading)
                .font(.custom(settings.titleFont, size: 20))
                .foregroundColor(Color(settings.primaryColor))
                .padding(.top, 16)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(settings.borderColor))
                HStack {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(Color(settings.primaryColor))
                        Text(String(lesson.quizData!.quizQuestions.count)+" Questions")
                            .font(.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.primaryTextColor))
                        
                        Spacer()
                    }
                    
                    Divider()
                        .frame(height: UIScreen.main.bounds.height/15 - 15, alignment: .center)
                    
                    HStack {
                        Spacer()
                        
                        Image(systemName: "asterisk.circle.fill")
                            .foregroundColor(Color(uiColor:settings.accentColor))
                        Text(String(courseViewModel.getQuizPoints(lessonId: lesson.id))+" Points")
                            .font(.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.primaryTextColor))
                        
                        Spacer()
                    }
                }
            }.frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height/15, alignment: .center)
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("DESCRIPTION")
                        .font(.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.secondaryTextColor))
                    
                    Text(lesson.quizData!.description)
                        .font(.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.primaryTextColor))
                    
                    Text("QUESTIONS & TOPICS")
                        .font(.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.secondaryTextColor))
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(lesson.quizData!.quizQuestions) { question in
                            HStack {
                                Text("\u{2022}")
                                    .foregroundColor(Color(settings.primaryTextColor))
                                
                                Text(String(question.id + 1))
                                    .font(.custom(settings.descriptionFont, size: 14))
                                    .foregroundColor(Color(settings.primaryColor))
                                
                                Text(": "+question.questionContent.topic)
                                    .font(.custom(settings.descriptionFont, size: 14))
                                    .foregroundColor(Color(settings.primaryTextColor))
                            }
                        }
                    }
                    
                }.padding(.horizontal)
            }
            
            NavigationLink(destination: QuizQuestionView(
                courseViewModel: courseViewModel,
                settings: settings,
                quizQuestions: lesson.quizData!.quizQuestions,
                currentQuestion: lesson.quizData!.quizQuestions[0],
                lessonId: lesson.id
            ), label: {
                Text("Start Attempt")
                    .font(Font.custom(settings.titleFont, size: 16))
                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                    .background(Color(settings.primaryColor))
                    .foregroundColor(Color(settings.buttonTextColor))
                    .cornerRadius(UIScreen.main.bounds.width/35)
                    .padding(.bottom, UIScreen.main.bounds.height/10)
            })
            
           
        }.navigationTitle(lesson.title)
    }
}
