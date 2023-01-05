//
//  QuizQuestionView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/28/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct QuizQuestionView: View {
    
    @ObservedObject var lessonViewModel: LessonViewModel
    var settings: CourseAssets
    @State var currentQuestion: QuizQuestion
    @State var questionCounter: Int = 0
    @State var showResult: Bool = false
    @State var isFinished: Bool = false
    @State var hasSelectedAnswer: Bool = false
    @State var chosenAnswer: String = ""
    @State var score: Int = 0

    @Environment(\.presentationMode) var presentationMode
    
    init(lessonViewModel: LessonViewModel, settings: CourseAssets) {
        self.lessonViewModel = lessonViewModel
        self.settings = settings
        //FIXME: force unwrap
        self._currentQuestion = State(wrappedValue: lessonViewModel.quiz.quizQuestions.first!)
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            HStack {
                Button {
                    // save progress
                    print("ON X \(Double(questionCounter) / Double(lessonViewModel.quiz.quizQuestions.count))")
                    
                    lessonViewModel.saveLessonProgress(userId: "nurios", progress: (Double(questionCounter) / Double(lessonViewModel.quiz.quizQuestions.count)))
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(uiColor: settings.primaryColor))
                }

                ProgressView(value: Double(self.questionCounter + 1), total: Double(lessonViewModel.quiz.quizQuestions.count))
                    .accentColor( Color(settings.primaryColor))
                    .padding(.horizontal, 20)
                HStack {
                    Image(systemName: "asteriks")
                        .foregroundColor(Color(settings.buttonTextColor))
                    Text("\(currentQuestion.points)")
                        .font(.custom(settings.titleFont, size: 14))
                        .foregroundColor(Color(settings.buttonTextColor))
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color(settings.accentColor))
                .clipShape(Capsule())
            }
            
            HStack {
                Text("Question \(currentQuestion.id + 1) of \(lessonViewModel.quiz.quizQuestions.count)")
                    .font(.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.secondaryTextColor))
                    .padding(.top, 10)
                Spacer()
            }

            Text(currentQuestion.questionContent.question)
                .font(.custom(settings.titleFont, size: 16))
                .foregroundColor(Color(settings.primaryTextColor))
                .padding(.top, 10)
                .multilineTextAlignment(.leading)
            
            VStack {
                SingleChoiceButtonList(
                    settings: settings,
                    answers: currentQuestion.questionContent.answers!,
                    correctAnswer: currentQuestion.questionContent.correctAnswer, chosenAnswer: $chosenAnswer,
                    showResult: showResult,
                    hasSelectedAnswer: $hasSelectedAnswer
                )
            }
            .disabled(showResult ? true : false)
            
            Spacer()
            Button(
                action: {
                    if hasSelectedAnswer {
                        if showResult {
                            if self.questionCounter == lessonViewModel.quiz.quizQuestions.count - 1 {
                                self.isFinished = true
                                lessonViewModel.saveLessonProgress(userId: "nurios", progress: 1.0)
                                // save progress
                            } else {
                                self.questionCounter += 1
                                self.currentQuestion = lessonViewModel.quiz.quizQuestions[questionCounter]
                                self.showResult = false
                                self.hasSelectedAnswer = false
                            }
                        } else {
                            updateScore()
                            self.showResult = true
                        }
                    }
                }, label: {
                    Text(showResult ? (questionCounter == lessonViewModel.quiz.quizQuestions.count - 1 ? "Finish Attempt" : "Next Question") : "Check Answer")
                        .font(Font.custom(settings.titleFont, size: 16))
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .background(Color(settings.primaryColor))
                        .accentColor(Color(settings.buttonTextColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                }
            )
        }
        .padding(.horizontal, 20)
        .onAppear {
            questionCounter = Int((lessonViewModel.getLessonProgress(userId: "nurios") * Double(lessonViewModel.quiz.quizQuestions.count)).rounded()) % lessonViewModel.quiz.quizQuestions.count
            print(questionCounter)
//            0.0 -> 0
//            0.33 -> 1
//            0.66 -> 2
//            1.0 -> 0
          
           
            currentQuestion = lessonViewModel.quiz.quizQuestions[questionCounter]
        }
        .navigationBarHidden(true)
    }
    
    func updateScore() {
        for answer in currentQuestion.questionContent.correctAnswer where chosenAnswer == answer {
                self.score += currentQuestion.points
        }
        print(score)
    }
}


@available(iOS 15.0, *)
struct SingleChoiceButtonList: View {
    var settings: CourseAssets
    let answers: [String]
    let correctAnswer: [String]
    @Binding var chosenAnswer: String
    var showResult: Bool
    @Binding var hasSelectedAnswer: Bool
    
    var body: some View {
        ScrollView {
            ForEach(answers, id: \.self) { answer in
                SingleChoiceButtonRow(
                    settings: settings,
                    answer: answer,
                    tapAction: {
                        hasSelectedAnswer = true
                        self.chosenAnswer = answer
                    },
                    chosen: chosenAnswer == answer,
                    showResult: self.showResult,
                    isCorrect: self.isCorrect(answer: answer))
                
            }
            .padding(0)
        }
        .onAppear {
            hasSelectedAnswer = false
        }
    }
    
    func isCorrect(answer: String) -> Bool {
        for ans in self.correctAnswer where answer == ans {
            return true
        }
        return false
    }
}

@available(iOS 15.0, *)
struct SingleChoiceButtonRow: View {
    var settings: CourseAssets
    let answer: String
    let tapAction: () -> Void
    let chosen: Bool
    let showResult: Bool
    let isCorrect: Bool
    
    var body: some View {
        Button(
            action: {
                tapAction()
            }, label: {
                HStack {
                    Text(answer)
                        .font(.custom(settings.titleFont, size: 16))
                        .foregroundColor(chosen ? Color(settings.primaryColor) : .black)
                        .padding(.leading, 20)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
                
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        //FIXME: this is unreadable :)
                        showResult ? (isCorrect ? Color(uiColor: settings.successPrimaryColor) : (chosen ? Color(uiColor: settings.errorPrimaryColor) : Color(settings.borderColor))) :
                            (chosen ? Color(settings.primaryColor) : Color(settings.borderColor)), lineWidth: 2))
                
                .background(
                    showResult ? (isCorrect ? Color(uiColor: settings.successSecondaryColor) : (chosen ? Color(uiColor: settings.errorSecondaryColor) : .white)) : (chosen ? Color(settings.secondaryColor) : .white))
                
            }
        )
        .cornerRadius(12)
        .padding(.top, 10)
    }
}
