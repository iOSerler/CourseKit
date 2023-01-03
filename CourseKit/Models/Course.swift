//
//  CourseModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//  Modified by Nursultan Askarbekuly on 03.01.2023

import Foundation

struct Course: Identifiable, Decodable {
    var id: Int
    var title: String
    var shortDescription: String
    var longDescription: String
    var duration: String
    var posterSmall: String
    var posterBig: String
    var isSaved: Bool
    var isPopular: Bool
    var author: String
    var sections: [CourseSection]
}

struct CourseSection: Identifiable, Decodable {
    var id: Int
    var title: String
    var description: String
    var lessons: [Lesson]
}


