//
//  TextImageLessonView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/16/22.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import SwiftUI

@available(iOS 15.0, *)
struct TextImageLessonView: View {
    
    @ObservedObject var lessonViewModel: LessonViewModel
    var settings: CourseAssets
    
    @State private var scrollViewHeight: CGFloat = 0
    @State private var proportion: CGFloat = 0
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                
                Text(lessonViewModel.lesson.description ?? "")
                    .font(.custom(settings.descriptionFont, size: 16))
                    .foregroundColor(Color(settings.secondaryTextColor))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                
                HStack {
                    Image(systemName: "timer")
                        .foregroundColor(Color(settings.secondaryTextColor))
                    Text(lessonViewModel.lesson.duration ?? "")
                        .font(.custom(settings.descriptionFont, size: 16))
                        .foregroundColor(Color(settings.secondaryTextColor))
                        .padding(.leading, 10)
                    Spacer()
                }
                
                VStack {
                    ForEach(lessonViewModel.textLesson.sections ?? []) { section in
                        TextImageLessonSectionView(settings: settings, section: section)
                    }
                    
                    LessonFooterView(settings: settings)
                        .padding(.leading, 8)
                }
            }
            .navigationTitle(lessonViewModel.lesson.title)
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal, 20)
            .background(
                GeometryReader { geo in
                    let scrollLength = geo.size.height - scrollViewHeight
                    let rawProportion = -geo.frame(in: .named("scroll")).minY / scrollLength
                    let proportion = min(max(rawProportion, 0), 1)
                    
                    Color.clear
                        .preference(
                            key: ScrollProportion.self,
                            value: proportion
                        )
                        .onPreferenceChange(ScrollProportion.self) { proportion in
                            self.proportion = proportion
                            
                        }
                }
            )
            
        }
        .onWillDisappear {
            lessonViewModel.saveLessonProgress(userId: "nurios", progress: self.proportion)
        }
        .background(
            GeometryReader { geo in
                Color.clear.onAppear {
                    scrollViewHeight = geo.size.height
                }
            }
        )
        .coordinateSpace(name: "scroll")
    }
}

@available(iOS 15.0, *)
struct WillDisappearHandler: UIViewControllerRepresentable {
    func makeCoordinator() -> WillDisappearHandler.Coordinator {
        Coordinator(onWillDisappear: onWillDisappear)
    }

    let onWillDisappear: () -> Void

    func makeUIViewController(context: UIViewControllerRepresentableContext<WillDisappearHandler>) -> UIViewController {
        context.coordinator
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<WillDisappearHandler>) {
    }

    typealias UIViewControllerType = UIViewController

    class Coordinator: UIViewController {
        let onWillDisappear: () -> Void

        init(onWillDisappear: @escaping () -> Void) {
            self.onWillDisappear = onWillDisappear
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            onWillDisappear()
        }
    }
}

@available(iOS 15.0, *)
struct WillDisappearModifier: ViewModifier {
    let callback: () -> Void

    func body(content: Content) -> some View {
        content
            .background(WillDisappearHandler(onWillDisappear: callback))
    }
}

@available(iOS 15.0, *)
extension View {
    func onWillDisappear(_ perform: @escaping () -> Void) -> some View {
        self.modifier(WillDisappearModifier(callback: perform))
    }
}
