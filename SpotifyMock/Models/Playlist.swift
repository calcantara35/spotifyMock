//
//  Playlist.swift
//  SpotifyMock
//
//  Created by Cesar Alcantara on 9/1/21.
//

import Foundation

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
    
}

struct User: Codable {
    let id: String
    let external_urls: [String: String]
}
