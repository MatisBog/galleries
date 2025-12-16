//
//  ContentView.swift
//  galleries
//
//  Created by Matis Bogaert on 11/12/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(GalleryDataStore.self) var galleryDataStore
    @State var selectedGallery : Gallery?
    @State var loading = false
    var body: some View {
        TabView{
            Tab {
                VStack{
                    List(galleryDataStore.getAllGalleries(), id: \.self, selection: $selectedGallery) { gallery in
                        Text("\(gallery.name)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.brown)
                        Text("\(gallery.location)")
                            .fontWeight(.bold)
                        Text("\(gallery.description)")
                            .font(.subheadline)
                    }
                }
            } label: {
                Text("Galleries")
            }
            
            Tab {
                if let selectedGallery = selectedGallery {
                    GalleryView(gallery: selectedGallery)
                }else{
                    Text("Please select a gallery")
                }
            } label: {
                if let selectedGallery = selectedGallery {
                    Text("\(selectedGallery.name)")
                }else {
                    Text("No gallery")
                }
            }


                
                
                
        }
        .task {
            await galleryDataStore.loadData()
            loading = true
        }
    }
}

