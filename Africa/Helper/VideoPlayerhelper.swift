//
//  VideoPlayerhelper.swift
//  Africa
//
//  Created by Arjun Rana on 06/05/26.
//


//List {
//                ForEach(video){ item in
//                    VideoListItemView(video: item)
//                        .padding(.vertical , 8)
//                }
//            }.listStyle(InsetGroupedListStyle())
//            
//                .navigationBarTitle("Video" , displayMode: .inline)
import Foundation

import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String , fileFormat: String ) -> AVPlayer {
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
