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

}
