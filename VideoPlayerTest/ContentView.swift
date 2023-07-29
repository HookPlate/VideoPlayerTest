//
//  ContentView.swift
//  VideoPlayerTest
//
//  Created by robin tetley on 10/07/2023...
//
import AVKit
import SwiftUI

struct ContentView: View {
    
    let url = Bundle.main.url(forResource: "Onboarding Amagama No Boarders Small", withExtension: ".mov")!
   // let path = URL(string: "https://bit.ly/swswift")!
//    let url = URL(string:"https://dl.dropboxusercontent.com/scl/fi/y956mthwzemxzzosbm52u/Onboarding-Amagama-smaller-SD-480p.mov?rlkey=0mbifn0pv33zzzhjnzjm83wfw&dl=0")!
    
    @State var player = AVPlayer()
    @State var isShowingTutorial = false
    
    
    var body: some View {
        GeometryReader { geometry in
            let twoThirdsWidth = geometry.size.width * 2 / 2.5
            let twoThirdsHeight = geometry.size.height * 2 / 2.5
            
            VStack{
                if isShowingTutorial {
                    ZStack(alignment: .topLeading) {
                        VideoPlayer(player: player)
                            .frame(width: twoThirdsWidth, height: twoThirdsHeight)
                         //   .aspectRatio(16/9, contentMode: .fit)
                            .onAppear() {
                                player = AVPlayer(url: url)
                                player.play()
                            }
                        Button {
                            isShowingTutorial.toggle()
                            player.pause()
                        } label: {
                            Image(systemName: "xmark.circle")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                        }
                        
                        
                    }
                    
                } else {
                    Button {
                        isShowingTutorial.toggle()
                    } label: {
                        Image(systemName: "questionmark.circle")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                           // .frame(alignment: .topTrailing)
                    }

                }
            }
            .frame(width: geometry.size.width,
                               height: geometry.size.height,
                               alignment: .center)
        }
        
        
        
        
            
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
