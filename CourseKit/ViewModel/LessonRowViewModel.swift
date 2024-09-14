//
//  LessonRowViewModel.swift
//  CourseKit
//
//  Created by Nursultan Askarbekuly on 03.01.2023.
//

import Foundation

@available(iOS 15.0, *)
public class LessonRowViewModel: ObservableObject {
    
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
    
    func logLessonProgress(progress: String) {
        storage.logActivityProgress(activityId: lesson.id, type: lesson.type, progress: progress, startDate: startDate)
    }
    
    func getLessonProgress() -> Double {
        let progress = storage.getActivityProgress(activityId: lesson.id)
        return progress
    }
}
