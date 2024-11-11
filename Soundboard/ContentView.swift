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
    
    var body: some View {
        VStack {
            HStack {
                Text("   PHS Soundboard")
                    .foregroundColor(.black)
                    .font(.custom("American Typewriter", size: 45))
                    .bold()
                Button {
                    playSound(song: "NationalAnthem")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 260, height: 60)
                            .foregroundColor(.blue)
                        Text("National Anthem")
                            .frame(width: 150, height: 60)
                            .foregroundColor(.white)
                            .font(.custom("American Typewriter", size: 20))
                            .bold()
                    }
                }
//                Spacer()
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
                Text("     ")
            }
            .padding(10)
            Divider()
            //            Spacer()
            ScrollView {
                VStack {
                    HStack {
                        Button {
                            playSound(song: "U Cant Touch This")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Can't Touch This")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 25))
                                    .bold()
                                    .padding()
                            }
                        }
                        
                        Button {
                            playSound(song: "All I Do Is Win (1)")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("All I Do Is Win")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 25))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: "FEIN")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("FE!N")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 25))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: "My House Snippet")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("My House")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 25))
                                    .bold()
                            }
                        }
                        
                    }
                    HStack{
                        Button {
                            playSound(song: "Back In Black")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Back in Black")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 25))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        
                    }
                    HStack{
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        
                    }
                    HStack{
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        
                    }
                    HStack{
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        
                    }
                    HStack{
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        
                    }
                    HStack{
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        Button {
                            playSound(song: " ")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 150, height: 150)
                                    .padding()
                                    .foregroundColor(.black)
                                Text("Song Name")
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 20))
                                    .bold()
                            }
                        }
                        
                    }
                }
            }
            Spacer()
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
