//
//  CourseModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//  Modified by Nursultan Askarbekuly on 03.01.2023

import Foundation

public struct Course: Identifiable, Decodable {
    public var id: Int
    var titleEn: String
    var titleRu: String
    var shortDescriptionEn: String
    var shortDescriptionRu: String
    var longDescriptionRu: String
    var longDescriptionEn: String

    var duration: String
    var posterSmall: String
    var posterBig: String
    var isSaved: Bool
    var isPopular: Bool
    var author: String
    var sections: [CourseSection]
    
    var title: String {
        isRussian ? titleRu : titleEn
    }
    
    var shortDescription: String {
        isRussian ? shortDescriptionRu : shortDescriptionEn
    }
    
    var longDescription: String {
        isRussian ? longDescriptionRu : longDescriptionEn
    }
    
}

public struct CourseSection: Identifiable, Decodable {
    public var id: String
    var titleEn: String
    var titleRu: String
    var descriptionEn: String
    var descriptionRu: String
    
    var title: String {
        isRussian ? titleRu : titleEn
    }
    
    var description: String {
        isRussian ? descriptionRu : descriptionEn
    }
    
    
    var lessons: [Lesson]
}


