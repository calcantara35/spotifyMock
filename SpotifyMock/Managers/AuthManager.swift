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
    
    struct Constants {
        static let clientID = "3a736c37078a4aaa936f39db4ed71483"
        static let clientSecret = "eb20e3921818414ab87c07562dadbdf0"
    }
    
    public var signInUrl: URL? {
        let base = "https://accounts.spotify.com/authorize"
        let scope = "user-read-private"
        let redirectUri = "https://github.com/calcantara35/spotifyMock"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scope)&redirect_uri=\(redirectUri)&show_dialog=TRUE"
        return URL(string: string)
    }
    
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
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping (Bool) -> Void) {
        // get token
        
    }
    
    private func cacheToken() {
        
    }
}
