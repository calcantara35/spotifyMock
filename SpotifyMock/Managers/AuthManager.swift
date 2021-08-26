//
//  AuthManager.swift
//  SpotifyMock
//
//  Created by Cesar Alcantara on 8/26/21.
//

import Foundation

// responsible for signing in and checking for that
final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExperiationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
}
