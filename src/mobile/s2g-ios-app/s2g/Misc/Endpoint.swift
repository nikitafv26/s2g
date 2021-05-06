//
//  Endpoint.swift
//  s2g
//
//  Created by Nikita Fedorenko on 31.12.2020.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem]?
}

extension Endpoint{
    var url: URL?{
        var components = URLComponents()
        components.scheme = "https"
        components.host = "localhost"
        components.path = path
        components.port = 5001
        components.queryItems = queryItems
        return components.url
    }
}
