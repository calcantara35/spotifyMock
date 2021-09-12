//
//  User.swift
//  SpotifyMock
//
//  Created by Cesar Alcantara on 9/8/21.
//

import Foundation

struct User: Codable {
    let id: String
    let display_name: String
    let external_urls: [String: String]
}
