//
//  ContentView.swift
//  Meditation-App
//
//  Created by Palatip Jantawong on 16/10/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var audioManager: AudioManager
    
    var body: some View {
        MeditationView()
            .environmentObject(audioManager)
    }
}

#Preview {
    ContentView()
        .environmentObject(AudioManager())
}
