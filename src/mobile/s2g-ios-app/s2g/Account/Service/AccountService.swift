//
//  AccountService.swift
//  s2g
//
//  Created by Nikita Fedorenko on 03.01.2021.
//

import Foundation

protocol AccountServiceProtocol {
    func create(register: Register, completion: @escaping (Register) -> Void)
    func login(login: Login, completion: @escaping (LoginResult?, RequestError?) -> Void)
}

class AccountService: AccountServiceProtocol {

    var requestManager: RequestManager
    let baseUrl = "/api/account"
    
    init() {
        requestManager = RequestManager()
    }
    
    func create(register: Register, completion: @escaping (Register) -> Void) {
        let endpoint = Endpoint(path: "\(baseUrl)/register", queryItems: nil)
        requestManager.post(data: register, url: endpoint.url!)
        requestManager.resultHandler = {(data: Any?, error: RequestError?) in
            let result = data as! LoginResult
            print(result.access_token)
            print(error?.description ?? "")
        }
    }
    
    func login(login: Login, completion: @escaping (LoginResult?, RequestError?) -> Void) {
        let endpoint = Endpoint(path: "\(baseUrl)/login", queryItems: nil)
        requestManager.post(data: login, url: endpoint.url!)
        requestManager.resultHandler = {(data: Any?, error: RequestError?) in
            guard let result = data as? LoginResult else {
                completion(nil, error)
                return
            }
            completion(result, nil)
        }
    }
    
}
