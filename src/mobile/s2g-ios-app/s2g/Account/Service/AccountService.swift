//
//  AccountService.swift
//  s2g
//
//  Created by Nikita Fedorenko on 03.01.2021.
//

import Foundation

public class AccountService{
    
    var requestManager: RequestManager<User>
    var endpoint = Endpoint(path: "/api/account/register", queryItems: nil)
    
    init() {
        requestManager = RequestManager<User>(fullUrl: endpoint.url!)
    }
    
    func create(_ user: User, completion: @escaping (User) -> Void) {
        requestManager.post(data: user)
        requestManager.resultHandler = {(data: User?, error: RequestError?) in
            print(data?.name ?? "")
            print(error?.description ?? "")
        }
    }
    
}
