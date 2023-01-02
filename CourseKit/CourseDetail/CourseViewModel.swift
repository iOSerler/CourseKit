//
//  CourseViewModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import Foundation

class CourseViewModel: ObservableObject {
    @Published var course: Course!
    @Published var lessons = [Lesson]()
    
    
    init() {
        loadCourse()
        loadLessons()
    }
    
    func loadCourse() {
        guard let url = Bundle.main.url(forResource: "course", withExtension: "json") else {
            print("course.json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let course = try JSONDecoder().decode(Course.self, from: data)
            self.course = course
        } catch {
            print(error.localizedDescription)
        }
        
        
        
    }
    
    func loadLessons() {
        guard let url = Bundle.main.url(forResource: "lessons", withExtension: "json")
        else {
            print("lessons json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let lessons = try? JSONDecoder().decode([Lesson].self, from: data!)
        self.lessons = lessons!
        
    }
    
    func getLessonsBySection(sectionId: Int) -> [Lesson] {
        var lessonsArr = [Lesson]()
        let lessonsIds = course.sections[sectionId - 1].lessons
        for ind in lessonsIds {
            lessonsArr.append(self.lessons[ind - 1])
        }
        return lessonsArr
    }
    
    func saveCourseProgress(userId: Int) -> Double {
        var sum = 0.0
        var counter = 0
        for section in course.sections {
            for lessonId in section.lessons {
                let progress = getLessonProgress(userId: userId, lessonId: lessonId)
                sum += progress
                counter += 1
            }
        }
        let key = "course_\(userId)_\(course.id)"
        UserDefaults.standard.set(sum / Double(counter), forKey: key)
        return sum / Double(counter)
    }
    
    
    func getCourseProgress(userId: Int) -> Double {
        let key = "course_\(userId)_\(course.id)"
        let progress = UserDefaults.standard.value(forKey: key)
        if let progress = progress as? Double {
            return progress
        }
        return 0.0
    }
    
    func saveLessonProgress(userId: Int, lessonId: Int, progress: Double) {
        let key = "lesson_\(userId)_\(lessonId)"
        UserDefaults.standard.set(progress, forKey: key)
    }
    
    func getLessonProgress(userId: Int, lessonId: Int) -> Double {
        let key = "lesson_\(userId)_\(lessonId)"
        let progress = UserDefaults.standard.value(forKey: key) as? Double ?? 0.0
        return progress
    }
    
    func getQuizPoints(lessonId: Int) -> Int {
        let lesson = self.lessons[lessonId - 1]
        var count = 0
        
        if lesson.type == "quiz" || lesson.type == "finalQuiz"{
            for question in lesson.quizData!.quizQuestions {
                count += question.points
            }
            return count
        } else {
            return 0
        }
    }

}
