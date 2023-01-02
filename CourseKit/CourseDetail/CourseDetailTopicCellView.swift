//
//  CourceTopicCellView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import SwiftUI

struct CourseDetailTopicCellView: View {
    
    @ObservedObject var courseViewModel: CourseViewModel
    @State var lesson: Lesson
    @State var progress: Double = 0.0
    var settings: ViewAssets
    
    var icon: String {
        switch lesson.type {
        case "text":
            return "doc.text"
        case "video":
            return "film"
        default:
            return "puzzlepiece.extension"
        }
    }
    
    var body: some View {
        
        HStack(alignment: .top) {
            Image(systemName: icon)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text(lesson.title)
                    .font(.custom(settings.titleFont, size: 14))
                    .foregroundColor(Color(settings.primaryTextColor))
                Text(lesson.description!)
                    .font(.custom(settings.descriptionFont, size: 12))
                    .foregroundColor(Color(settings.secondaryTextColor))
                    .multilineTextAlignment(.leading)
                HStack(alignment: .center) {
                    
                    ProgressView(value: self.progress * 100, total: 100)
                        .accentColor(self.progress != 1 ? Color(settings.primaryColor) : Color(settings.successPrimaryColor))
                        .padding(.trailing, 20)
                    
                    Text("\(Int((self.progress * 100).rounded())) %")
                        .font(.custom(settings.descriptionFont, size: 12))
                        .foregroundColor(Color(settings.primaryTextColor))
                        .padding(.trailing, 20)
                }
                
            }
            
            Spacer()
        }
        
        .onDidAppear {
            
                self.progress = courseViewModel.getLessonProgress(userId: 1, lessonId: self.lesson.id)
            
        }
    }
}



extension View {
  func onDidAppear(_ perform: @escaping (() -> Void)) -> some View {
    self.modifier(ViewDidAppearModifier(callback: perform))
  }
}

struct ViewDidAppearModifier: ViewModifier {
  let callback: () -> Void

  func body(content: Content) -> some View {
    content
      .background(ViewDidAppearHandler(onDidAppear: callback))
  }
}

struct ViewDidAppearHandler: UIViewControllerRepresentable {
  func makeCoordinator() -> ViewDidAppearHandler.Coordinator {
    Coordinator(onDidAppear: onDidAppear)
  }

  let onDidAppear: () -> Void

  func makeUIViewController(context: UIViewControllerRepresentableContext<ViewDidAppearHandler>) -> UIViewController {
    context.coordinator
  }

  func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ViewDidAppearHandler>) {
  }

  typealias UIViewControllerType = UIViewController

  class Coordinator: UIViewController {
    let onDidAppear: () -> Void

    init(onDidAppear: @escaping () -> Void) {
      self.onDidAppear = onDidAppear
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      onDidAppear()
    }
  }
}
