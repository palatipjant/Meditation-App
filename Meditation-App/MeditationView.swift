//
//  MeditationView.swift
//  Meditation-App
//
//  Created by Palatip Jantawong on 16/10/2566 BE.
//

import SwiftUI

struct MeditationView: View {
    
    @EnvironmentObject var audioManager: AudioManager
    @State var showPlayer = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Mark: Image
            Image("main")
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            
            // Mark: Meditation Details
            ZStack{
                //Mark: Background
                Color(.black)
                
                VStack(alignment: .leading, spacing: 18) {
                    HStack(alignment: .center, spacing: 8){
                        Text("music")
                        Text("0s")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    Text("Water")
                        .font(.title)
                    
                    Text("Time to twerkyyy 👻.")
                    
                    HStack(alignment: .center, spacing: 10){
                        Image(systemName: "heart.fill")
                        Text("24k Liked")
                        Image(systemName: "airpodsmax")
                        Text("34k Listening")
                    }
                    //Divider()
                    
                    Text("Related")
                        .font(.title3)
                    
                    ScrollView(.horizontal){
                        HStack(spacing:10){
                            ForEach(demoRelated) { relate in
                                VStack(alignment: .leading, spacing:10){
                                    Image(relate.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 180)
                                    Text(relate.name)
                                        .font(.headline)
                                    HStack(spacing:8){
                                        Text(relate.time)
                                            .font(.caption)
                                        Text(relate.category.uppercased())
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                    }.scrollIndicators(.hidden)
                    
                    Spacer()
                    
                }
                .padding()
                .foregroundStyle(Color.white)
                
                VStack{
                    Spacer()
                    
                    Button(action: {
                        showPlayer.toggle()
                    }, label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding(.vertical, 15)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(.capsule)
                            .padding()
                            .padding(.bottom)
                    }).fullScreenCover(isPresented: $showPlayer, content: {
                        PlayerView(isPreview: true)
                            .environmentObject(AudioManager())
                    })
                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    MeditationView()
        .environmentObject(AudioManager())
}

//Mark: Model for Related List
struct RelatedModel: Identifiable{
    var id = UUID()
    var image:String
    var name: String
    var time: String
    var category: String
}

// Sample Mock Data
var demoRelated: [RelatedModel] = [
    RelatedModel(image:  "moon", name: "Moon Clouds", time: "45 min", category: "Sleep Music"),
    RelatedModel(image:  "sweet_sleep", name: "Sweet Sleep", time: "45 min", category: "Sleep Music")
]
