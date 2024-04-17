//
//  ContentView.swift
//  EmojiSearch
//
//  Created by MacBook Pro on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .foregroundStyle(.red)
            Text("Hello, Ridhwan!")
                .foregroundStyle(.green)
            Text("Mantap Juga lu steve job")
                .foregroundStyle(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
