//
//  LessonViewModel.swift
//  CourseKit
//
//  Created by Nursultan Askarbekuly on 03.01.2023.
//

import Foundation

@available(iOS 15.0, *)
public class LessonViewModel: ObservableObject {
    
    @Published public var lesson: Lesson
    let storage: CourseStorage
    private let startDate = Date()
    
    init(lesson: Lesson, storage: CourseStorage) {
        self.lesson = lesson
        self.storage = storage
    }
    
    public var id: String {
        lesson.id
    }
    
    public var url: String {
        lesson.url
    }
    
    public var title: String {
        lesson.title
    }
    
    public var description: String {
        lesson.description
    }
    
    var quiz: QuizLesson {
        storage.quizLessons.first(where: {$0.id == lesson.id})!
    }
    
    var textLesson: TextLesson {
        storage.textLessons.first(where: {$0.id == lesson.id})!
    }
    
    var videoLesson: VideoLesson {
        storage.videoLessons.first(where: {$0.id == lesson.id})!
    }
    
    func saveLessonProgress(progress: Double) {
        storage.saveProgress(lessonId: lesson.id, lessonType: "article", progress: progress, startDate: startDate)
    }
    
    func getLessonProgress() -> Double {
        let progress = storage.getLessonProgress(lessonId: lesson.id)
        return progress
    }
    
    func getQuizPoints() -> Int {
        var count = 0
        
        for question in quiz.quizQuestions {
            count += question.points
        }
        return count
    }
}
