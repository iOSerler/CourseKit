//
//  NotificationsPermission.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.

import Foundation

struct NotificationPermission {
    var title: String
    var description: String
    var alertImage: String
    var arrowImage: String
    
}

var notificationPermissionData = NotificationPermission(
    title: "Get daily reminders to meet your personal goals.",
    description: "You’ll get daily reminders about your courses and new daily deals from our shop.",
    alertImage: "NotificationFrame",
    arrowImage: "up-arrow"
)
