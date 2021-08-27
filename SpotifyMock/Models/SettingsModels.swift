//
//  SettingsModels.swift
//  SpotifyMock
//
//  Created by Cesar Alcantara on 8/27/21.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
    
}
