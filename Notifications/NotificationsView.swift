//
//  NotificationsView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct NotificationsView: View {
    var settings: CourseAssets
    @State private var selectedSegment = 0
    @ObservedObject var notificationViewModel: NotificationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedSegment) {
                    Text("Notifications").tag(0)
                    Text("News").tag(1)
                    
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                selectedSegment == 0 ? ListView(pageSettings: settings, listType: "notifications", notificationViewModel: notificationViewModel) :
                ListView(pageSettings: settings, listType: "news", notificationViewModel: notificationViewModel)
            }
        }
    }
}
