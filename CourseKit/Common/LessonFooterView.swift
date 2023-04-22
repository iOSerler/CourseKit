//
//  LessonFooterView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 16.06.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct LessonFooterView: View {
//    var footer: LessonFooter = lessonFooter
    var settings: CourseAssets
    var body: some View {
        VStack(alignment: .center) {
            Button(
                action: {
                    // do something
                }, label: {
                    Text("Complete lesson")
                }
            )
        }
    }
}
