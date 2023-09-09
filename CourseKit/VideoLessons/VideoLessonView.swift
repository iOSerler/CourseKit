//
//  VideoLessonView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 15.06.2022.
//

import SwiftUI
import AVKit

@available(iOS 15.0, *)
struct VideoLessonView: View {
    
    @ObservedObject var lessonViewModel: LessonViewModel
    var settings: CourseAssets
    
    @State var player = AVPlayer()
    
    init(lessonViewModel: LessonViewModel, settings: CourseAssets) {
        self.lessonViewModel = lessonViewModel
        self.settings = settings
        
        if let url = URL(string: lessonViewModel.lesson.url) {
            self.player = AVPlayer(url: url)
        } else {
            self.player = AVPlayer()
        }
    }
    
    var body: some View {
        VStack {
            
            AutoRotateVideoPlayerView(player: $player)
                .onAppear {
                    DispatchQueue.main.async {
                        
                        let progress = lessonViewModel.getLessonProgress()
                        
                        player.seek(to: CMTime(seconds: progress * CMTimeGetSeconds(player.currentItem!.asset.duration), preferredTimescale: player.currentTime().timescale))
                    }
                }
                .onWillDisappear {
                    DispatchQueue.main.async {
                        
                        if let itemDuration = player.currentItem?.asset.duration {
                            
                            let progress = CMTimeGetSeconds(player.currentTime()) / CMTimeGetSeconds(itemDuration)
                            
                            guard progress >= 0 && progress <= 1 else {
                                return
                            }
                            
                            lessonViewModel.saveLessonProgress(progress: progress)
                        }
                        
                        
                    }
                }
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VideoDescriptionView(settings: settings,
                                         title: lessonViewModel.videoLesson.title,
                                         duration: lessonViewModel.lesson.duration ?? "",
                                         description: lessonViewModel.videoLesson.description)
                    
                    VideoStampsIView(settings: settings,
                                     stamps: lessonViewModel.videoLesson.stamps!,
                                     player: $player)
                    
                    LessonFooterView(settings: settings)
                        .padding(.leading, 8)
                    
                    
                }.padding()
            }
            
        }
    }
}
