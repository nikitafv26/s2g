//
//  Register.swift
//  s2g
//
//  Created by Nikita Fedorenko on 09.05.2021.
//

import Foundation

class Register : Codable {
    
    var name: String
    var email: String
    var pwd: String
    
    init(name: String, email: String, pwd: String) {
        self.name = name
        self.email = email
        self.pwd = pwd
    }
    
    enum CodingKeys: String, CodingKey {
        case
            name = "name",
            email = "email",
            pwd = "pwd"
            
    }
}
