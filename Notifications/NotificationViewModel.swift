//
//  NotificationViewModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 29.06.2022.
//

import Foundation

class NotificationViewModel: ObservableObject {
    @Published var notifications: [NewsItem]
    @Published var news: [NewsItem]
    
    init(notifications: [NewsItem], news: [NewsItem]) {
        self.notifications = notifications
        self.news = news
    }
    
    func getData(type: String) -> [NewsItem] {
        switch type {
        case "notifications":
            return self.notifications
        case "news":
            return self.news
        default:
            return []
        }
    }
}
