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
    
    @State var fileNames = ["All I Do Is Win (1)", "Back In Black", "FEIN", "My House Snippet", "U Cant Touch This", "Crank That", "Eye Of The Tiger", "Alright Snippet", "Humble Snippet", "Party in the USA Snippet"]
    @State var songNames = ["All I Do Is Win", "Back In Black", "Fein", "My House", "Cant Touch This", "Crank That Soulja", "Eye of the Tiger", "Alright", "Humble", "Party in the USA"]
    
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 4)
        
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
                    Text("")
                    
                }
            }
            .padding(10)
            Divider()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(Array(zip(fileNames, songNames)), id: \.0) { i, name in
                        Button {
                            playSound(song: i)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text(name)
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 25))
                                    .bold()
                                    .padding()
                            }
                        }
                    }
                }
            }
            Button {
                playSound(song: "NationalAnthem")
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 500, height: 70)
                        .foregroundColor(.blue)
                    Text("National Anthem")
                        .frame(height: 60)
                        .foregroundColor(.white)
                        .font(.custom("American Typewriter", size: 45))
                        .bold()
                }
            }
        }
        .padding()
    }
    //     mutating func playSound(song: String) {
    //        guard let url = Bundle.main.url(forResource: song, withExtension: "mp3") else {
    //            print("Could not find the sound file \(song).mp3")
    //            return
    //        }
    //
    //        do {
    //
    //            player = try AVAudioPlayer(contentsOf: url)
    //            player?.play()
    //        } catch {
    //            print("Error playing sound: \(error.localizedDescription)")
    //        }
    //    }
    func playSound(song: String) {
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
    
    //    func stopAllSounds() {
    //            if player?.isPlaying == true {
    //                player?.stop()
    //            }
    //        }
    func stopAllSounds() {
        guard let player = player, player.isPlaying else { return }
        
        // Cancel any ongoing fade-out to avoid conflicts
        fadeOutTimer?.invalidate()
        
        // Start the fade-out effect
        fadeOut(volumeDecreaseInterval: 0.1, duration: 2.0)
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
                player.stop()  // Stop the player once volume reaches zero
            }
        }
    }
}


#Preview {
    ContentView()
}
