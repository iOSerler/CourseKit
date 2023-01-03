//
//  LessonViewModel.swift
//  CourseKit
//
//  Created by Nursultan Askarbekuly on 03.01.2023.
//

import Foundation

class LessonViewModel: ObservableObject {
    
    @Published var lesson: Lesson
    @Published var quizzes = [QuizLesson]()
    @Published var videoLessons = [VideoLesson]()
    @Published var textLessons = [TextLesson]()
    
    
    var quiz: QuizLesson {
        quizzes.first(where: {$0.id == lesson.id})!
    }
    
    var textLesson: TextLesson {
        textLessons.first(where: {$0.id == lesson.id})!
    }
    
    var videoLesson: VideoLesson {
        videoLessons.first(where: {$0.id == lesson.id})!
    }
    
    init(lesson: Lesson) {
        self.lesson = lesson
        loadTextLessons()
        loadVideoLessons()
        loadQuizzes()
    }
    
    func loadTextLessons() {
        guard let url = Bundle.main.url(forResource: "texts", withExtension: "json")
        else {
            print("texts json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let texts = try JSONDecoder().decode([TextLesson].self, from: data)
            self.textLessons = texts
        } catch {
            print(#file, #function, error)
        }
    }
    
    func loadVideoLessons() {
        guard let url = Bundle.main.url(forResource: "videos", withExtension: "json")
        else {
            print("videos json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let videos = try JSONDecoder().decode([VideoLesson].self, from: data)
            self.videoLessons = videos
        } catch {
            print(#file, #function, error)
        }
    }
    
    
    func loadQuizzes() {
        guard let url = Bundle.main.url(forResource: "quizzes", withExtension: "json")
        else {
            print("quizzes json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let quizzes = try JSONDecoder().decode([QuizLesson].self, from: data)
            self.quizzes = quizzes
        } catch {
            print(#file, #function, error)
        }
        
    }
    
    func saveLessonProgress(userId: Int, progress: Double) {
        let key = "lesson_\(userId)_\(lesson.id)"
        UserDefaults.standard.set(progress, forKey: key)
    }
    
    func getLessonProgress(userId: Int) -> Double {
        let key = "lesson_\(userId)_\(lesson.id)"
        let progress = UserDefaults.standard.value(forKey: key) as? Double ?? 0.0
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
