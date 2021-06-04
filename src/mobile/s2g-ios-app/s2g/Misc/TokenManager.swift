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
    func get(tokenType: TokenType)
}

class TokenManager: TokenManagerProtocol {
    
    func save(accessToken: String, refreshToken: String) {
        
    }
    
    func get(tokenType: TokenType) {
        
    }
}
