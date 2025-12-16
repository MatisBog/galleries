//
//  GalleryView.swift
//  galleries
//
//  Created by Matis Bogaert on 11/12/2025.
//

import SwiftUI

struct GalleryView: View {
    @Environment(PathStore.self) var pathStore
    @Environment(GalleryDataStore.self) var galleryDataStore
    var gallery : Gallery
    @State var loading = true
    var body: some View {
        @Bindable var pathStore = pathStore
        NavigationStack(path: $pathStore.path){
            VStack {
                Text("\(gallery.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.brown)
                Divider()
                Text("\(gallery.location)")
                    .fontWeight(.bold)
                Text("\(gallery.description)")
                    .font(.subheadline)
                Divider()
                Text("List of artist")
                ForEach(gallery.artists, id: \.self) { artist in
                    NavigationLink("\(artist.name) \(artist.nationality)", value: Routes.Artist(artist))
                }
            }.navigationDestination(for: Routes.self) { route in
                switch route {
                case let .Artist(artist):
                    ArtistView(artist : artist)
                case let .Artwork(artwork):
                    ArtworkView(artwork : artwork, artist : artist)
                }
            }
        }.task {
            await galleryDataStore.loadData()
            loading = false
        }
    }
}


