//
//  CourseViewModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import Foundation

@available(iOS 15.0, *)
public class CourseViewModel: ObservableObject {
    
    @Published var course: Course
    let storage: CourseStorage

    public init(storage: CourseStorage) {
        self.storage = storage
        self.course = storage.course
    }
    
    func saveCourseProgress(userId: Int) -> Double {
        var sum = 0.0
        var counter = 0
        for section in course.sections {
            for lesson in section.lessons {
                let progress = LessonViewModel(lesson: lesson, storage: storage).getLessonProgress(userId: userId)
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
                let lessonVM = LessonViewModel(lesson: lesson, storage: storage)
                if lessonVM.getLessonProgress(userId: userId) < 1.0 {
                    return lessonVM
                }
            }
        }
        
        //FIXME: force unwrap
        return LessonViewModel(lesson: course.sections.first!.lessons.first!, storage: storage)
    }

}
