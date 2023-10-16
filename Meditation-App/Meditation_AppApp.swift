//
//  Meditation_AppApp.swift
//  Meditation-App
//
//  Created by Palatip Jantawong on 16/10/2566 BE.
//

import SwiftUI

@main
struct Meditation_AppApp: App {
    
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}
