//
//  Register.swift
//  s2g
//
//  Created by Nikita Fedorenko on 04.12.2020.
//

import Foundation

class Login : Codable {
    
    var name: String
    var pwd: String
    
    init(name: String, pwd: String) {
        self.name = name
        self.pwd = pwd
    }
    
    enum CodingKeys: String, CodingKey {
        case
            name = "Name",
            pwd = "Password"
    }
}

public class LoginResult : Decodable
{
    var name: String = ""
    var role: String = ""
    var access_token: String = ""
    var refresh_token: String = ""
    
    enum CodingKeys: String, CodingKey {
        case
            name = "UserName",
            role = "Role",
            access_token = "AccessToken",
            refresh_token = "RefreshToken"
    }
}
