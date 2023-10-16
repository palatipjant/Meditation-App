//
//  PlayerView.swift
//  Meditation-App
//
//  Created by Palatip Jantawong on 16/10/2566 BE.
//

import SwiftUI

struct PlayerView: View {
    
    @State private var value:Double = 0.0
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var audioManager: AudioManager
    var isPreview: Bool = false
    var timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack{
            //Mark: Background Image
            Image("music")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            VStack(spacing:32){
                HStack{
                    Button(action: {
                        do {
                            audioManager.playPause()
                            dismiss()
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                            .padding()
                            .background(.white.opacity(0.5))
                            .clipShape(.circle)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "heart")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.black.opacity(0.5))
                            .clipShape(.circle)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "square.and.arrow.down")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.black.opacity(0.5))
                            .clipShape(.circle)
                    })
                }
                Spacer()
                VStack{
                    Text("Water")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Twerky music".uppercased())
                        .opacity(0.5)
                }
                HStack(spacing:20){
                    Button(action: {
                        audioManager.player?.currentTime -= 15
                    }, label: {
                        Image(systemName: "gobackward.15")
                            .font(.title)
                    })
                    Button(action: {
                        audioManager.playPause()
                    }, label: {
                        Image(systemName: audioManager.player?.isPlaying ?? false ? "pause.fill" : "play.fill")
                            .font(.title)
                            .foregroundStyle(.black)
                            .padding(30)
                            .background(.white)
                            .clipShape(.circle)
                            .padding()
                            .background(.white.opacity(0.5))
                            .clipShape(.circle)
                    })
                    
                    Button(action: {
                        audioManager.player?.currentTime += 15
                    }, label: {
                        Image(systemName: "goforward.15")
                            .font(.title)
                    })
                    
                }
                
                //Mark: Playback timeline
                VStack(spacing:5){
                    Slider(value: $value, in: 0...Double(audioManager.player?.duration ?? 0)) {
                        editing in
                        print("editing" , editing)
                        if !editing {
                            audioManager.player?.currentTime = value
                        }
                    }
                }
                HStack{
                    Text("\(DateComponentsFormatter.positional.string(from: Double(audioManager.player?.currentTime ?? 0)) ?? "0:00")")
                    
                    Spacer()
                    
                    Text("\(DateComponentsFormatter.positional.string(from: Double(audioManager.player?.duration ?? 0)) ?? "0:00")")
                }
                Spacer()
                    .frame(height: UIScreen.main.bounds.height / 13)
            }.padding(20)
                .foregroundStyle(.white)
        }
        .onAppear{
            audioManager.startPlayer(track: "water", isPerview: isPreview )
        }
        .onReceive(timer) {_ in
            guard let player = audioManager.player else { return }
            value = player.currentTime
        }
    }
}

#Preview {
    PlayerView(isPreview: true)
        .environmentObject(AudioManager())
}
