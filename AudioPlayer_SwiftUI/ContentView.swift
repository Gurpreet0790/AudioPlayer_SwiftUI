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
    
    var albums = [Album(name: "Album 1", image: "albumCover1", songs: [Songs(name: "Song 1", time: "02:35"),
                                                                    Songs(name: "Song 2", time: "01:50"),
                                                                       Songs(name: "Song 3", time: "2:35"),
                                                                       Songs(name: "Song 4", time: "01:35"),
                                                                       Songs(name: "Song 5", time: "02:30")
                                                            ]),
                  Album(name: "Album 2", image: "albumCover2", songs: [Songs(name: "Song 1", time: "01:10"),
                                                                                  Songs(name: "Song 2", time: "03:50"),
                                                                                     Songs(name: "Song 3", time: "1:35"),
                                                                                     Songs(name: "Song 4", time: "01:30"),
                                                                                     Songs(name: "Song 5", time: "03:35")
                                                                          ]),
                  Album(name: "Album 3", image: "albumCover3", songs: [Songs(name: "Song 1", time: "02:05"),
                                                                                  Songs(name: "Song 2", time: "01:50"),
                                                                                     Songs(name: "Song 3", time: "3:15"),
                                                                                     Songs(name: "Song 4", time: "01:30"),
                                                                                     Songs(name: "Song 5", time: "03:35")
                                                                          ]),
                  Album(name: "Album 4", image: "albumCover4", songs: [Songs(name: "Song 1", time: "03:35"),
                                                                                  Songs(name: "Song 2", time: "03:50"),
                                                                                     Songs(name: "Song 3", time: "1:35"),
                                                                                     Songs(name: "Song 4", time: "01:30"),
                                                                                     Songs(name: "Song 5", time: "01:35")
                                                                          ]),
                  Album(name: "Album 5", image: "albumCover5", songs: [Songs(name: "Song 1", time: "1:35"),
                                                                                  Songs(name: "Song 2", time: "03:50"),
                                                                                     Songs(name: "Song 3", time: "2:35"),
                                                                                     Songs(name: "Song 4", time: "01:30"),
                                                                                     Songs(name: "Song 5", time: "01:35")
                                                                          ])]
    
    
   @State private var currentAlbum : Album?
    
    var body: some View {
        NavigationView{
            ScrollView{
                ScrollView(.horizontal, showsIndicators: false, content: {
                    
                    LazyHStack{
                        ForEach(self.albums, id: \.self, content: {
                            album in
                            AlbumArt(album: album).onTapGesture {
                                self.currentAlbum = album
                            }
                        })
                    }
                        
                })
                LazyVStack{
                    ForEach((self.currentAlbum?.songs ?? self.albums.first?.songs) ?? [Songs(name: "Song 1", time: "03:50"),
                                                                                      Songs(name: "Song 2", time: "03:50"),
                                                                                      Songs(name: "Song 3", time: "1:35"),
                                                                                      Songs(name: "Song 4", time: "01:30"),
                                                                                      Songs(name: "Song 5", time: "03:35")],
                            id: \.self,
                            content: {
                        song in
                        SongCell(song: song)
                    })
                }
            }
            .navigationTitle("Reet's Playlist")
        }
    }
}

struct AlbumArt: View{
    var album: Album
    var body: some View{
        ZStack(alignment: .bottom, content: {
            Image(album.image).resizable().aspectRatio(contentMode: .fill).frame(width: 170, height: 200, alignment: .center)
            
                ZStack{
                    BlurEffect(style: .dark)
                    Text(album.name).foregroundColor(.white)
                }.frame(height: 50, alignment: .center)
        })
        .frame(width: 170, height: 200, alignment: .center)
        .clipped().cornerRadius(20).shadow(radius: 10).padding(20)
    }
}
struct SongCell: View{
    var song: Songs
    var body: some View{
        HStack{
            ZStack{
                Circle().frame(width: 50, height: 50, alignment: .center).foregroundColor(.green)
                Circle().frame(width: 20, height: 20, alignment: .center).foregroundColor(.white)
            }
            Text(song.name)
                .font(.headline)
            
            Spacer()
            Text(song.time)
        }
        .padding(20)
    }
}

#Preview {
    ContentView()
}

