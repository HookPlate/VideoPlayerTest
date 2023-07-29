//
//  VideoPlayerView.swift
//  VideoPlayerTest
//
//  Created by robin tetley on 29/07/2023.
//
import SwiftUI
import AVKit
import AVFoundation

struct VideoPlayerView: View {
    let videoURL: URL

    var body: some View {
        GeometryReader { geo in
            AVPlayerControllerRepresented(videoURL: videoURL)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct AVPlayerControllerRepresented: UIViewControllerRepresentable {
    let videoURL: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        let player = AVPlayer(url: videoURL)
        playerViewController.player = player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Nothing to update here
    }
}


//struct VideoPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoPlayerView()
//    }
//}
