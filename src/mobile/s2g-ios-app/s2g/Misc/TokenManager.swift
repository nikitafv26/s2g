//
//  TokenManager.swift
//  s2g
//
//  Created by Nikita Fedorenko on 04.06.2021.
//

import Foundation
import SwiftKeychainWrapper

enum TokenType {
    case access
    case refresh
}

protocol TokenManagerProtocol {
    func save(accessToken: String, refreshToken: String)
    func get(tokenType: TokenType) -> String?
}

class TokenManager: TokenManagerProtocol {
    
    func save(accessToken: String, refreshToken: String) {
        KeychainWrapper.standard.set(accessToken, forKey: GlobalSettings.access_token)
        KeychainWrapper.standard.set(refreshToken, forKey: GlobalSettings.refresh_token)
    }
    
    func get(tokenType: TokenType) -> String? {
        switch tokenType {
        case .access:
            return KeychainWrapper.standard.string(forKey: GlobalSettings.access_token)
        case .refresh:
            return KeychainWrapper.standard.string(forKey: GlobalSettings.refresh_token)
        }
    }
}
