//
//  NewReleasesResponse.swift
//  SpotifyMock
//
//  Created by Cesar Alcantara on 8/31/21.
//

import Foundation

struct NewReleasesResponse: Codable {
    let albums: AlbumsResponse
}

struct AlbumsResponse: Codable {
    let items: [Album]
}

