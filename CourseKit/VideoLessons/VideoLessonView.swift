//
//  VideoLessonView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 15.06.2022.
//

import SwiftUI
import AVKit

struct VideoLessonView: View {
    
    @ObservedObject var courseViewModel: CourseViewModel
    var settings: ViewAssets
    var videoLesson: Lesson
    
    @State var player: AVPlayer
    
    init(courseViewModel: CourseViewModel, settings: ViewAssets, videoLesson: Lesson) {
        self.courseViewModel = courseViewModel
        self.settings = settings
        self.videoLesson = videoLesson
        self.player = AVPlayer(url: URL(string: videoLesson.url!)!)
    }
    
    var body: some View {
        VStack {
            
            AutoRotateVideoPlayerView(player: $player)
                .onAppear {
                    DispatchQueue.main.async {
                        
                        let progress = courseViewModel.getLessonProgress(userId: 1, lessonId: self.videoLesson.id)
                        
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
                            
                            courseViewModel.saveLessonProgress(userId: 1, lessonId: self.videoLesson.id, progress: progress)
                        }
                        
                        
                    }
                }
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VideoDescriptionView(settings: settings,
                                         title: videoLesson.title,
                                         duration: videoLesson.duration ?? "",
                                         description: videoLesson.description!)
                    
                    VideoStampsIView(settings: settings,
                                     stamps: videoLesson.stamps!,
                                     player: $player)
                    
                    LessonFooterView(settings: settings)
                        .padding(.leading, 8)
                    
                    
                }.padding()
            }
            
        }
    }
}
