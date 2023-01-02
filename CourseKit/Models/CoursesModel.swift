//
//  CoursesModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import Foundation

struct Course: Identifiable, Decodable {
    var id: Int
    var title: String
    var shortDescription: String
    var longDescription: String
    var duration: String
    var posterSmall: String
    var posterBig: String
    var isSaved: Bool
    var isPopular: Bool
    var author: String
    var sections: [CourseSection]
}

struct CourseSection: Identifiable, Decodable {
    var id: Int
    var title: String
    var description: String
    var lessons: [Int]
}

struct TextLessonData: Identifiable, Decodable {
    var id: Int
    var text: String
    var image: String
}
struct TextLessonSection: Identifiable, Decodable {
    var id: Int
    var title: String
    var data: [TextLessonData]
}

struct VideoLessonStamp: Decodable {
    var seconds: Double
    var textTime: String
    var textDescription: String
}

struct Lesson: Identifiable, Decodable {
    var id: Int
    var type: String
    var title: String
    var description: String?
    var duration: String?
    var quizData: QuizData?
    var background: String?
    var sections: [TextLessonSection]?
    var url: String?
    var stamps: [VideoLessonStamp]?
}

struct LessonFooter {
    var copyrightText: String
    var previousBottonImage: String
    var nextButtonImage: String
    var priviousButtonText: String
    var nextButtonText: String
}

var lessonFooter = LessonFooter(
    copyrightText: "Copyright © ReusEd 2022, Inc. All rights reserved worldwide",
    previousBottonImage: "Previous",
    nextButtonImage: "Next",
    priviousButtonText: "Previous",
    nextButtonText: "Next"
)

struct QuizData: Identifiable, Decodable {
    var id: Int
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
