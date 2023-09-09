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
    
    func saveCourseProgress() {
        storage.saveCourseProgress()
    }
    
    
    func getCourseProgress() -> Double {
        let progress = storage.getCourseProgress()
        return progress
    }
    
    
    func getFirstUnfinishedLesson(for userId: String) -> LessonViewModel {
        for section in self.course.sections {
            for lesson in section.lessons {
                let lessonVM = LessonViewModel(lesson: lesson, storage: storage)
                if lessonVM.getLessonProgress() < 1.0 {
                    return lessonVM
                }
            }
        }
        
        //FIXME: force unwrap
        return LessonViewModel(lesson: course.sections.first!.lessons.first!, storage: storage)
    }

}
