//
//  UserProfile.swift
//  SpotifyMock
//
//  Created by Cesar Alcantara on 8/26/21.
//

import Foundation

struct UserProfile: Codable {
    let country: String
    let email: String
    let explicit_content: [String: Int]
    let external_urls: [String: String]
    //let followers: [String: Codable?]
    let id: String
    let product: String
    let images: [UserImage]
    
}

struct UserImage: Codable {
    let url: String
}
