//
//  RequestError.swift
//  s2g
//
//  Created by Nikita Fedorenko on 30.01.2021.
//

import Foundation

public struct RequestError : Error{
    
    let description: String
    let code: Int
    
    init(code: Int, description: String) {
        self.code = code
        self.description = description
    }
}
