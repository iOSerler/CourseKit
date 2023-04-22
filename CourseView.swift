//
//  CourseView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import SwiftUI

@available(iOS 15.0, *)
public struct CourseView: View {
    
    @ObservedObject var courseViewModel: CourseViewModel
    var settings: CourseAssets
    var callbackDict: [String: ((LessonViewModel)->Void)]
    
    public init(courseViewModel: CourseViewModel, settings: CourseAssets, callbackDict: [String: ((LessonViewModel)->Void)]) {
        self.courseViewModel = courseViewModel
        self.settings = settings
        self.callbackDict = callbackDict
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                if let detail = courseViewModel.course {
                    Text(detail.title)
                        .font(.custom(settings.titleFont, size: 31))
                        .foregroundColor(Color(settings.primaryTextColor))
                    
                    ForEach(detail.sections) { section in
                        SectionView(
                            courseViewModel: courseViewModel,
                            settings: settings,
                            callbackDict: callbackDict,
                            section: section
                        )
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
            .padding(.bottom, 50)
        }
    }
}


