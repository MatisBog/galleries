//
//  ArtworkView.swift
//  galleries
//
//  Created by Matis Bogaert on 16/12/2025.
//

import SwiftUI

struct ArtworkView: View {
    @Environment(GalleryDataStore.self) var galleryDataStore
    var artwork : Artwork
    var artist : Artist
    var body: some View {
        VStack{
            Text("\(artwork.title)")
                .foregroundStyle(.brown)
                .fontWeight(.bold)
                .font(.largeTitle)
            Divider()
            Text("\(artwork.medium)").fontWeight(.bold)
            Text("\(artwork.dimensions)")
            Text("\(artwork.description)")
            Text("Artist : \(galleryDataStore.)")
        }
    }
}

