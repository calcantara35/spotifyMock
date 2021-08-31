//
//  Artist.swift
//  SpotifyMock
//
//  Created by Cesar Alcantara on 8/26/21.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}
