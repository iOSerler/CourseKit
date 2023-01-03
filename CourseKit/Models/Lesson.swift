//
//  Lesson.swift
//  CourseKit
//
//  Created by Nursultan Askarbekuly on 03.01.2023.
//

import Foundation

struct Lesson: Identifiable, Decodable {
    var id: String
    var type: String
    var title: String
    var description: String?
    var url: String?
    var duration: String?
}

struct VideoLesson: Identifiable, Decodable {
    var id: String
    var title: String
    var description: String
    var stamps: [VideoLessonStamp]?
}

struct VideoLessonStamp: Decodable {
    var seconds: Double
    var textTime: String
    var textDescription: String
}

struct TextLesson: Identifiable, Decodable {
    var id: String
    var title: String
    var description: String
    var sections: [TextLessonSection]?
}

struct TextLessonSection: Identifiable, Decodable {
    var id: Int
    var title: String
    var data: [TextLessonData]
}
struct TextLessonData: Identifiable, Decodable {
    var id: Int
    var text: String
    var image: String
}

struct QuizLesson: Identifiable, Decodable {
    var id: String
    var title: String
    var description: String
    var quizQuestions: [QuizQuestion]
}

struct QuizQuestion: Identifiable, Decodable {
    var id: Int
    var type: String
    var points: Int
    var questionContent: QuizQuestionContent
}

struct QuizQuestionContent: Decodable {
    var topic: String
    var question: String
    var answers: [String]?
    var correctAnswer: [String]
}


//
//struct LessonFooter {
//    var copyrightText: String
//    var previousBottonImage: String
//    var nextButtonImage: String
//    var priviousButtonText: String
//    var nextButtonText: String
//}
//
//var lessonFooter = LessonFooter(
//    copyrightText: "Copyright © ReusEd 2022, Inc. All rights reserved worldwide",
//    previousBottonImage: "Previous",
//    nextButtonImage: "Next",
//    priviousButtonText: "Previous",
//    nextButtonText: "Next"
//)
