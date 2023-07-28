//
//  VideoPlayerView.swift
//  VideoPlayerTest
//
//  Created by robin tetley on 28/07/2023.
//

import SwiftUI

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @State private var isVideoLoading = false
    @State private var isVideoPlaying = false
    @State private var videoPlayer: AVPlayer?

    private let videoURL = URL(string:"https://dl.dropboxusercontent.com/scl/fi/y956mthwzemxzzosbm52u/Onboarding-Amagama-smaller-SD-480p.mov?rlkey=0mbifn0pv33zzzhjnzjm83wfw&dl=0")!

    var body: some View {
        ZStack {
            if isVideoPlaying {
                // Show the video player
                VideoPlayer(player: videoPlayer!)
                    .onAppear {
                        // Start playing the video when the view appears
                        videoPlayer?.play()
                    }
            } else {
                // Show the loading screen
                VStack {
                    ProgressView()
                    Text("Loading Video...")
                }
                .opacity(isVideoLoading ? 1 : 0)
            }
            Button {
                isVideoLoading = true
                downloadVideo()
            } label: {
//                Image(systemName: "questionmark.circle")
//                    .font(.largeTitle)
//                    .foregroundColor(.green)
                   // .frame(alignment: .topTrailing)
                Color.clear
            }
        }
    }

    private func downloadVideo() {
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: videoURL) { (url, _, error) in
          //  guard let self = self else { return }

            if let error = error {
                // Handle error if needed
                print("Error downloading video: \(error)")
            } else if let url = url {
                // Video download is complete, prepare the player
                self.videoPlayer = AVPlayer(url: url)
                self.isVideoLoading = false
                self.isVideoPlaying = true
            }
        }
        downloadTask.resume()
    }
}


struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
