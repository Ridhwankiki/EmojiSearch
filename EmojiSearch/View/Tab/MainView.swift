//
//  MainView.swift
//  EmojiSearch
//
//  Created by MacBook Pro on 18/04/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Emoji", systemImage: "ev.plug.dc.nacs.fill")
                }
            Text("Map View")
                .tabItem {
                    Label("Location", systemImage: "map")
                }
                .badge(4)
            
            Text("Setting")
                .tabItem {
                    Label("Setting", systemImage: "gear")
                }
        }
        .tint(.primary)
    }
}

#Preview {
    MainView()
}
