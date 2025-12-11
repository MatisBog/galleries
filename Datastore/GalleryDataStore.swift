//
//  GalleryDataStore.swift
//  galleries
//
//  Created by Matis Bogaert on 11/12/2025.
//

import Foundation

@Observable
class GalleryDataStore{
    private(set) var galleries = Galleries()
    
    init(){
        Task { (await loadData()) }
    }
    func getAllGalleries() -> [Gallery] {
        let galleries = galleries.galleries
        return galleries
    }
    
    func loadData() async {
        do{
            galleries = try load("galleries.json")
        } catch {
            galleries = Galleries()
        }
    }
}
