//
//  ContentView.swift
//  CourseKit
//
//  Created by Nursultan Askarbekuly on 02.01.2023.
//

import SwiftUI

struct HomeView: View {
    
    var settings: ViewAssets
    @StateObject var courseViewModel = CourseViewModel()
    
    var body: some View {
        NavigationStack{
            CourseDetailView(courseViewModel: courseViewModel,  settings: settings)
                .navigationTitle("Bismillah")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
}
