//
//  ContentView.swift
//  Soundboard
//
//  Created by Liam K. Seymour on 11/7/24.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        VStack {
            HStack {
                Text("PHS Soundboard")
                    .foregroundColor(.black)
                    .font(.custom("American Typewriter", size: 35))
                Button() {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                }
            }
            Divider()
//            Spacer()
            VStack {
                HStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .padding()
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .padding()
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .padding()
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .padding()
                    
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
