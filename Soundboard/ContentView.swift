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
    
    @State var fileNames = ["All I Do Is Win", "Back In Black", "Fein", "My House", "Cant Touch This", "Crank That Soulja", "Eye of the Tiger", "Alright", "Humble", "Party in the USA", "Welcome to the Jungle", "Bad Moon Rising", "Centuries", "Old Town Road"]
    @State var songNames = ["All I Do Is Win", "Back In Black", "Fein", "My House", "Cant Touch This", "Crank That Soulja", "Eye of the Tiger", "Alright", "Humble", "Party in the USA", "Welcome to the Jungle", "Bad Moon Rising", "Centuries", "Old Town Road"]
    @State var authors = ["DJ Khaled", "AC/DC", "Travis Scott", "Flo Rida", "MC Hammer", "Soulja Boy", "Survivor", "Kendrick Lamar", "Kendrick Lamar", "Miley Cyrus", "Guns N' Roses", "John Fogerty", "Fall Out Boy", "Lil Nas X"]
    @State var filters = ["Pop", "Rock", "Hip Hop", "Pop", "Pop", "Hip Hop", "Rock", "Hip Hop", "Hip Hop", "Pop", "Rock", "Country", "Rock", "Country"]
    
    @State private var selectedFilter: String = "All"
    @State private var searchQuery: String = ""  // Search query for filtering songs
    
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
        
        VStack {
            HStack {
                Text("  PHS Soundboard")
                    .foregroundColor(.black)
                    .font(.custom("American Typewriter", size: 45))
                    .bold()
                Spacer()
                Button {
                    playRandomSong()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 200, height: 60)
                            .foregroundColor(.blue)
                        Text("Random")
                            .foregroundColor(.black)
                            .font(.custom("American Typewriter", size: 40))
                    }
                }
                Spacer()
                Button {
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
                Text("  ")
            }
            .padding(10)
//            Song Length Bar
//            ZStack(alignment: .leading) {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(height: 10)
//                    .foregroundColor(.gray.opacity(0.3))
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: UIScreen.main.bounds.width * CGFloat(songProgress), height: 10)
//                    .foregroundColor(.blue)
//            }
//            .padding()
            


            
            Divider()
            
            HStack {
                Menu {
                    Button("All") { selectedFilter = "All" }
                    Button("Hip Hop") { selectedFilter = "Hip Hop" }
                    Button("Rock") { selectedFilter = "Rock" }
                    Button("Pop") { selectedFilter = "Pop" }
                } label: {
                    HStack {
                        Text("Filters: \(selectedFilter)")
                            .foregroundColor(.black)
                            .font(.custom("", size: 30))
                            .padding()
                        Image(systemName: "line.3.horizontal.circle")
                            .foregroundColor(.black)
                            .font(.custom("", size: 30))
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            
            // Conditionally show the search bar if "All" filter is selected
            if selectedFilter == "All" {
                HStack {
                    TextField("Search songs...", text: $searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
            }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(
                        filteredSongs(),
                        id: \.0
                    ) { index, song in
                        let (fileName, songName) = song
                        Button {
                            playSound(song: songName)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.black.opacity(1))
                                    .frame(width: 200, height: 200)
                                    .shadow(color: .black, radius: 8)
                                VStack(spacing: 10) {
                                    Spacer()
                                    Text(songName)
                                        .frame(width: 180)
                                        .foregroundColor(.white)
                                        .font(.custom("", size: 30))
                                        .multilineTextAlignment(.center)
                                        .bold()
                                    Spacer()
                                    Text(filters[index])
                                        .foregroundColor(.gray)
                                        .font(.custom("", size: 20))
                                        .multilineTextAlignment(.center)
                                    Text(authors[index])
                                        .foregroundColor(.gray)
                                        .font(.custom("", size: 20))
                                        .multilineTextAlignment(.center)
                                }
                                .padding(.vertical, 10)
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
    
    // Helper function to filter songs based on selected filter and search query
    func filteredSongs() -> [(Int, (String, String))] {
        Array(zip(fileNames.indices, zip(fileNames, songNames)))
            .filter { index, song in
                let matchesFilter = selectedFilter == "All" || filters[index] == selectedFilter
                let matchesQuery = searchQuery.isEmpty || song.1.lowercased().contains(searchQuery.lowercased())
                return matchesFilter && matchesQuery
            }
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
        fadeOutTimer?.invalidate()
        fadeOut(volumeDecreaseInterval: 0.1, duration: 2.0)
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
                currentSong = nil
            }
        }
    }
    
    func playRandomSong() {
        if let randomSong = fileNames.randomElement() {
            playSound(song: randomSong)
        } else {
            print("The fileNames array is empty.")
        }
    }
    

    
}

#Preview {
    ContentView()
}
