//
//  ContentView.swift
//  VideoPlayerTest
//
//  Created by robin tetley on 10/07/2023.
//
import AVKit
import SwiftUI

struct ContentView: View {
    
    let path = Bundle.main.url(forResource: "screencast_smaller", withExtension: ".mov")!
    
    @State var player = AVPlayer()

    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                player = AVPlayer(url: path)
                player.play()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
