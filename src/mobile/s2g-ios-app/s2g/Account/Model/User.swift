//
//  Register.swift
//  s2g
//
//  Created by Nikita Fedorenko on 04.12.2020.
//

import Foundation

public class User: Codable{
    
    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
    
    enum CodingKeys: String, CodingKey{
        case
            name = "name",
            email = "email",
            password = "password"
    }
}
