//
//  LessonRowView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//  Modified by Nursultan Askarbekuly on 02.01.2023

import SwiftUI

@available(iOS 15.0, *)
struct LessonRowView: View {
    
    @ObservedObject var lessonViewModel: LessonViewModel
    @State var progress: Double = 0.0
    var settings: CourseAssets
    
    var icon: String {
        switch lessonViewModel.lesson.type {
        case "text":
            return "doc.richtext"
        case "article":
            return "doc.text"
        case "page":
            return "network"
        case "video":
            return "film"
        case "quiz":
            return "puzzlepiece.extension"
        default:
            return ""
        }
    }
    
    var body: some View {
        
        HStack(alignment: .top) {
            VStack {
                Image(systemName: icon)
            }
            .frame(width: 20)
            .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text(lessonViewModel.lesson.title)
                    .font(.custom(settings.titleFont, size: 14))
                    .foregroundColor(Color(settings.primaryTextColor))
                if let description = lessonViewModel.lesson.description {
                    Text(description)
                        .font(.custom(settings.descriptionFont, size: 12))
                        .foregroundColor(Color(settings.secondaryTextColor))
                        .multilineTextAlignment(.leading)
                }
                
                HStack(alignment: .center) {
                    
                    ProgressView(value: self.progress * 100, total: 100)
                        .accentColor(Int((self.progress * 100).rounded()) != 100 ? Color(settings.primaryColor) : Color(settings.successPrimaryColor))
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
            
                self.progress = lessonViewModel.getLessonProgress(userId: 1)
            
        }
    }
}


@available(iOS 15.0, *)
extension View {
  func onDidAppear(_ perform: @escaping (() -> Void)) -> some View {
    self.modifier(ViewDidAppearModifier(callback: perform))
  }
}

@available(iOS 15.0, *)
struct ViewDidAppearModifier: ViewModifier {
  let callback: () -> Void

  func body(content: Content) -> some View {
    content
      .background(ViewDidAppearHandler(onDidAppear: callback))
  }
}

@available(iOS 15.0, *)
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
