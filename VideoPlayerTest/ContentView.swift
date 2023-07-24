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
    let url = URL(string:"https://dl.dropboxusercontent.com/scl/fi/fiw6h66hcbm34vbjyi410/shorter_movie.mov?rlkey=57n0nmp7km20wt9vmhnqvf2ja&dl=0")!
    
    @State var player = AVPlayer

    
    var body: some View {
        
        VideoPlayer(player: player(url))
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
