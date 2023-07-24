//
//  ContentView.swift
//  VideoPlayerTest
//
//  Created by robin tetley on 10/07/2023...
//
import AVKit
import SwiftUI

struct ContentView: View {
    
//    let path = Bundle.main.url(forResource: "screencast_smaller", withExtension: ".mov")!
   // let path = URL(string: "https://bit.ly/swswift")!
    let url = URL(string:"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4")!
    
    @State var player = AVPlayer()

    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: url))
            .onAppear {
                player.play()
            }
            
            
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
