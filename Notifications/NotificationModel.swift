//
//  NotificationModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import Foundation

struct NewsItem: Identifiable {
    var id: Int
    var title: String
    var image: String?
    var time: String
    var description: String
}

 var notifications = [
         NewsItem(
             id: 0,
             title: "Notification 1",
             time: "20:35",
             description: "vvfa fuahihvadbvrb skadhjbejhvfqf sdsfbjehbfjwe dkabhevblqhvadb abvjdbva"),
         NewsItem(
             id: 1,
             title: "Notification 2",
             time: "8:35",
             description: "vvfa fuahihvadbvrb skadhjbejhvfqf sdsfbjehbfjwe dkabhevblqhvadb abvjdbva"),
         NewsItem(
             id: 2,
             title: "Notification 3",
             time: "10:35",
             description: "vvfa fuahihvadbvrb skadhjbejhvfqf sdsfbjehbfjwe dkabhevblqhvadb abvjdbva"),
         NewsItem(
             id: 3,
             title: "Notification 4",
             time: "18:35",
             description: "vvfa fuahihvadbvrb skadhjbejhvfqf sdsfbjehbfjwe dkabhevblqhvadb abvjdbva"),
         NewsItem(
             id: 4,
             title: "Notification 5",
             time: "20:15",
             description: "vvfa fuahihvadbvrb skadhjbejhvfqf sdsfbjehbfjwe dkabhevblqhvadb abvjdbva")
 ]

var news = [
        NewsItem(
            id: 0,
            title: "News 1",
            image: "newspaper",
            time: "20:35",
            description: "vvfa fuahihvadbvrb skadhjbejhvfqf sdsfbjehbfjwe dkabhevblqhvadb abvjdbva"),
        NewsItem(
            id: 1,
            title: "News 2",
            image: "newspaper",
            time: "6:35",
            description: "vvfa fuahihvadbvrb skadhjbejhvfqf sdsfbjehbfjwe dkabhevblqhvadb abvjdbva"),
        NewsItem(
            id: 2,
            title: "News 3",
            image: "newspaper",
            time: "17:00",
            description: "vvfa fuahihvadbvrb skadhjbejhvfqf sdsfbjehbfjwe dkabhevblqhvadb abvjdbva")
        
]
