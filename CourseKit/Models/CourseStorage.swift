//
//  CourseStorage.swift
//  CourseKit
//
//  Created by Nursultan Askarbekuly on 04.01.2023.
//

import Foundation

public protocol CourseStorage: NSObject {

    var course: Course {get}
    var quizLessons: [QuizLesson] {get}
    var videoLessons: [VideoLesson] {get}
    var textLessons: [TextLesson] {get}
    
    
    func saveCourseProgress(userId: String)
    func getCourseProgress(userId: String) -> Double
    
    func saveLessonProgress(userId: String, lessonId: String, lessonType: String, progress: Double, startDate: Date)
    func getLessonProgress(userId: String, lessonId: String) -> Double
        
}
