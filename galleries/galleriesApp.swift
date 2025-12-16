//
//  galleriesApp.swift
//  galleries
//
//  Created by Matis Bogaert on 11/12/2025.
//

import SwiftUI

@main
struct galleriesApp: App {
    @State var galleryDataStore =
    GalleryDataStore()
    @State var pathStore = PathStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(galleryDataStore)
                .environment(pathStore)
        }
    }
}
