//
//  MockAccountService.swift
//  s2gTests
//
//  Created by Nikita Fedorenko on 19.05.2021.
//

import Foundation

@testable import s2g
final class MockAccountService : AccountServiceProtocol{
    
    func create(register: Register, completion: @escaping (Register) -> Void) {
        
    }
    
    func login(login: Login, completion: @escaping (Login) -> Void) {
        
    }
}
