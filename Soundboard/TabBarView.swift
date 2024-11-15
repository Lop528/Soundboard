//
//  TabBarView.swift
//  Soundboard
//
//  Created by Oliver W. Dienhart on 11/15/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Label("SoundBoard", systemImage: "")
                }
            EmailView()
                .tabItem{
                    Label("Suggest Songs", systemImage: "")
                }
            
        }
    }
}
#Preview {
    TabBarView()
}
