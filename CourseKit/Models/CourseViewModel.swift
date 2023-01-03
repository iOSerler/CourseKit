//
//  CourseViewModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import Foundation

class CourseViewModel: ObservableObject {
    @Published var course: Course!
        
    init() {
        loadCourse()
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
            print(#file, #function, error.localizedDescription)
        }
        
    }
    
    func saveCourseProgress(userId: Int) -> Double {
        var sum = 0.0
        var counter = 0
        for section in course.sections {
            for lesson in section.lessons {
                let progress = LessonViewModel(lesson: lesson).getLessonProgress(userId: userId)
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
    
    
    func getFirstUnfinishedLesson(for userId: Int) -> LessonViewModel {
        for section in self.course.sections {
            for lesson in section.lessons {
                let lessonVM = LessonViewModel(lesson: lesson)
                if lessonVM.getLessonProgress(userId: userId) < 1.0 {
                    return lessonVM
                }
            }
        }
        
        //FIXME: force unwrap
        return LessonViewModel(lesson: course.sections.first!.lessons.first!)
    }

}
