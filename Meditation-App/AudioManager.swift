//
//  AudioManager.swift
//  Meditation-App
//
//  Created by Palatip Jantawong on 16/10/2566 BE.
//

import SwiftUI
import AVKit

final class AudioManager: ObservableObject{
    
//    static let shared = AudioManager()
    
    var player: AVAudioPlayer?
    
    func startPlayer(track:String, isPerview:Bool = false) {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Resource not found \(track)")
            return
        }
         
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url )
            
            if !isPerview {
                player?.prepareToPlay()
            } else {
                player?.play()
            }
        } catch {
            print("failed to initailize player", error)
        }
    }
    
    func playPause() {
        guard let player = player else {
            print("Instance of audio player not foud")
            return
        }
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
}
