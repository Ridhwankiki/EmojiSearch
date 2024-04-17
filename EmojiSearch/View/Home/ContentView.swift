//
//  ContentView.swift
//  EmojiSearch
//
//  Created by MacBook Pro on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText: String = ""
    
    @State private var isRedacted: Bool = true
    
    @State private var emojis: [Emoji] = EmojiProvider.allEmojis()
    
    var emojiSearchResults: [Emoji] {
        guard !searchText.isEmpty else {
            return emojis
        }
//        return emojis.filter { $0.name.lowercased().contains(searchText.lowercased())
        return emojis.filter { $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationStack{
            List(emojiSearchResults) { emoji in
                NavigationLink {
                    EmojiDetail(emoji: emoji)
                } label: {
                    if isRedacted {
                        EmojiRow(emoji: emoji)
                            .redacted(reason: .placeholder)
                    } else {
                        EmojiRow(emoji: emoji)
                    }
                }

//                    EmojiRow(emoji: emoji)
//                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Emoji")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isRedacted = false
                }
            }
            .refreshable {
                isRedacted = true
                
                let newRow = EmojiProvider.allEmojis().randomElement()
                emojis.insert(newRow ?? Emoji(emoji: "sss", name: "sss", description: "sss"), at: 0)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isRedacted = false
                }
//                emojis.insert(newRow!, at: 0)
//                emojis.insert(newRow ?? "", at: 0)
            }
            
//          .listStyle(.plain)
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "What emoji's that you're looking for?"
            )
            .overlay {
                if emojiSearchResults.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
