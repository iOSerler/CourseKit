//
//  CourseStorage.swift
//  CourseKit
//
//  Created by Nursultan Askarbekuly on 04.01.2023.
//

import Foundation

public protocol CourseStorage: NSObject {

    var course: Course {get}
    
    func saveCourseProgress()
    func getCourseProgress() -> Double
    
    func logActivityProgress(activityId: String, type: String, progress: String, startDate: Date)
    func getActivityProgress(activityId: String) -> Double
        
}
