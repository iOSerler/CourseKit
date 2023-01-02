//
//  TextImageLessonView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/16/22.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import SwiftUI

struct TextImageLessonView: View {
    
    @ObservedObject var courseViewModel: CourseViewModel
    var settings: ViewAssets
    var textLesson: Lesson
    
    @State private var scrollViewHeight: CGFloat = 0
    @State private var proportion: CGFloat = 0
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text(textLesson.description!)
                    .font(.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.tertiaryTextColor))
                    .multilineTextAlignment(.leading)
                HStack {
                    Image(systemName: "timer")
                    
                    Text(textLesson.duration!)
                        .font(.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.secondaryTextColor))
                        .padding(.leading, 10)
                    Spacer()
                }
                .padding(.leading, 20)
                
                VStack {
                    ForEach(textLesson.sections!) { section in
                        TextImageLessonSectionView(settings: settings, section: section)
                    }
                    
                    
                    LessonFooterView(settings: settings)
                        .padding(.leading, 8)
                }.navigationTitle(textLesson.title)
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(.horizontal, 20)
            }
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
            courseViewModel.saveLessonProgress(userId: 1, lessonId: self.textLesson.id, progress: self.proportion)
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

struct WillDisappearModifier: ViewModifier {
    let callback: () -> Void

    func body(content: Content) -> some View {
        content
            .background(WillDisappearHandler(onWillDisappear: callback))
    }
}

extension View {
    func onWillDisappear(_ perform: @escaping () -> Void) -> some View {
        self.modifier(WillDisappearModifier(callback: perform))
    }
}
