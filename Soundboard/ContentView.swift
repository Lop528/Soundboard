//
//  ContentView.swift
//  Soundboard
//
//  Created by Liam K. Seymour on 11/7/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var player: AVAudioPlayer?
    @State private var fadeOutTimer: Timer?
    @State private var currentSong: String? = nil
    
    @State var fileNames = ["All I Do Is Win (1)", "Back In Black", "FEIN", "My House Snippet", "U Cant Touch This", "Crank That", "Eye Of The Tiger", "Alright Snippet", "Humble Snippet", "Party in the USA Snippet", "insert thunderstruck", "Guns N roses"]
    @State var songNames = ["All I Do Is Win", "Back In Black", "Fein", "My House", "Cant Touch This", "Crank That Soulja", "Eye of the Tiger", "Alright", "Humble", "Party in the USA", "Thunderstruck", "Guns 'N Roses"]
    
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
        
        VStack {
            HStack {
                Text(" PHS Soundboard")
                    .foregroundColor(.black)
                    .font(.custom("American Typewriter", size: 45))
                    .bold()
                Spacer()
                Button() {
                    stopAllSounds()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.red)
                        Text("X")
                            .bold()
                            .foregroundColor(.black)
                            .font(.custom("", size: 40))
                        
                    }
                }
            }
            .padding(10)
            Divider()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(Array(zip(fileNames, songNames)), id: \.0) { i, name in
                        Button {
                            playSound(song: name)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.black.opacity(0.7))
                                    .frame(width: 200, height: 200)
                                    .shadow(color: .black, radius: 10)
                                
                                VStack(spacing: 0) {
                                    
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .fill(Color.blue)
                                            .frame(height: 50)
                                            .overlay(
                                                Text("Header Title")
                                                    .foregroundColor(.white)
                                                    .font(.headline)
                                                    .bold()
                                            )
                                    
                                    VStack {
                                        Text(name)
                                            .foregroundColor(.white)
                                            .font(.custom("", size: 30))
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            .bold()
                                        Button {
                                            songNames.insert(name, at: 0)
                                            fileNames.insert(i, at: 0)
                                        } label: {
                                            Text("Favorite")
                                                .offset(y: -5)
                                                .font(.custom("", size: 23))
                                        }
                                        
                                    }
                                }
                                .frame(width: 200, height: 200)
                            }
                            .padding()
                            
                        }
                    }
                    
                }
            }
            Button {
                playSound(song: "NationalAnthem")
            } label: {
                ZStack {
                        Image("USA")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .frame(width: 400, height: 100)
                    Text("National Anthem")
                        .frame(height: 100)
                        .foregroundColor(.black)
                        .font(.custom("American Typewriter", size: 45))
                        .bold()
                }
            }
        }
        .padding()
    }

    func playSound(song: String) {
        currentSong = song
        guard let url = Bundle.main.url(forResource: song, withExtension: "mp3") else {
            print("Could not find the sound file \(song).mp3")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    

    func stopAllSounds() {
        guard let player = player, player.isPlaying else { return }
        
        // Cancel any ongoing fade-out to avoid conflicts
        fadeOutTimer?.invalidate()
        
        // Start the fade-out effect
        fadeOut(volumeDecreaseInterval: 0.1, duration: 2.0)
        
        // Reset the current song when stopping
        currentSong = nil
    }
    func fadeOut(volumeDecreaseInterval: TimeInterval, duration: TimeInterval) {
        guard let player = player else { return }
        
        let steps = duration / volumeDecreaseInterval
        let volumeStep = player.volume / Float(steps)
        
        fadeOutTimer = Timer.scheduledTimer(withTimeInterval: volumeDecreaseInterval, repeats: true) { timer in
            if player.volume > 0 {
                player.volume -= volumeStep
            } else {
                timer.invalidate()
                player.stop()
                // Stop the player once volume reaches zero
                currentSong = nil
            }
        }
    }
}


#Preview {
    TabBarView()
}
