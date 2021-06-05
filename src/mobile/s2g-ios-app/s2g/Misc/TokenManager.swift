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
    
    let access_token: String = "accessToken"
    let refresh_token: String = "refreshToken"
    
    func save(accessToken: String, refreshToken: String) {
        KeychainWrapper.standard.set(accessToken, forKey: accessToken)
        KeychainWrapper.standard.set(refreshToken, forKey: refreshToken)
    }
    
    func get(tokenType: TokenType) -> String? {
        switch tokenType {
        case .access:
            return KeychainWrapper.standard.string(forKey: access_token)
        case .refresh:
            return KeychainWrapper.standard.string(forKey: refresh_token)
        }
    }
}
