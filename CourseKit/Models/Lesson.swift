//
//  Lesson.swift
//  CourseKit
//
//  Created by Nursultan Askarbekuly on 03.01.2023.
//

import Foundation

public struct Lesson: Identifiable, Decodable {
    public var id: String
    var type: String
    var titleEn: String
    var titleRu: String
    var descriptionEn: String?
    var descriptionRu: String?
    var urlEn: String?
    var urlRu: String?
    var duration: String?
    var showEn: Int
    var showRu: Int
    
    var title: String {
        isRussian ? titleRu : titleEn
    }
    
    var description: String {
        isRussian ? descriptionRu ?? "" : descriptionEn ?? ""
    }
    
    var url: String {
        isRussian ? urlRu ?? "" : urlEn ?? ""
    }
    
    var isShown: Int {
        isRussian ? showRu : showEn
    }
    
}

public struct VideoLesson: Identifiable, Decodable {
    public var id: String
    var title: String
    var description: String
    var stamps: [VideoLessonStamp]?
}

public struct VideoLessonStamp: Decodable {
    var seconds: Double
    var textTime: String
    var textDescription: String
}

public struct TextLesson: Identifiable, Decodable {
    public var id: String
    var title: String
    var description: String
    var sections: [TextLessonSection]?
}

public struct TextLessonSection: Identifiable, Decodable {
    public var id: Int
    var title: String
    var data: [TextLessonData]
}

public struct TextLessonData: Identifiable, Decodable {
    public var id: Int
    var text: String
    var image: String
}

public struct QuizLesson: Identifiable, Decodable {
    public var id: String
    var title: String
    var description: String
    var quizQuestions: [QuizQuestion]
}

public struct QuizQuestion: Identifiable, Decodable {
    public var id: Int
    var type: String
    var points: Int
    var questionContent: QuizQuestionContent
}

public struct QuizQuestionContent: Decodable {
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
