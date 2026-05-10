//
//  VideoListView.swift
//  Africa
//
//  Created by Arjun Rana on 21/04/26.
//

import SwiftUI

struct VideoListView: View {
    
    @State var video: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(video){ item in
                    NavigationLink( destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical , 8)
                    }
                }
            }.listStyle(.inset)
                .navigationBarTitle("Video" , displayMode: .inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            
                            video.shuffle()
                            hapticImpact.impactOccurred()
                        }){
                            Image(systemName: "arrow.2.squarepath")
                        }
                    }
                }
            
        }
    }
}

#Preview {
    VideoListView()
}
