//
//  ContentView.swift
//  AudioPlayer_SwiftUI
//
//  Created by ReetDhillon on 2024-02-10.
//

import SwiftUI

struct Album: Hashable{
    var id = UUID()
    var name: String
    var image: String
    var songs: [Songs]
}
struct Songs: Hashable{
    var id = UUID()
    var name: String
    var time: String
}

struct ContentView: View {
    
    var albums = [Album(name: <#String#>, image: <#String#>, songs: <#[Songs]#>)]
    var body: some View {
        NavigationView{
            ScrollView{
                ScrollView(.horizontal, showsIndicators: true, content: {})
        
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
