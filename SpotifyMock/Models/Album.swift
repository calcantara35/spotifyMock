//
//  Album.swift
//  SpotifyMock
//
//  Created by Cesar Alcantara on 8/31/21.
//

import Foundation

struct Album: Codable {
    let album_type: String
    let artists: [Artist]
    let available_markets: [String]
    let id: String
    let images: [APIImage]
    let total_tracks: Int
    let name: String
}
