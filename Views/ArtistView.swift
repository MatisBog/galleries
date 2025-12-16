//
//  ArtistView.swift
//  galleries
//
//  Created by Matis Bogaert on 16/12/2025.
//

import SwiftUI

struct ArtistView: View {
    var artist : Artist
    var body: some View {
        VStack{
            Text("\(artist.name)")
                .foregroundStyle(.brown)
                .fontWeight(.bold)
                .font(.largeTitle)
            Divider()
            Text("\(artist.style)").fontWeight(.bold)
            Text("\(artist.description)")
            Divider()
            Text("List of art").foregroundStyle(.brown)
            ForEach(artist.artworks, id: \.self) { artwork in
                NavigationLink("\(artwork.title)", value: Routes.Artwork(artwork))
            }
        }
    }
}

