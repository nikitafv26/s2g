//
//  EmailLoginViewModel.swift
//  s2g
//
//  Created by Nikita Fedorenko on 09.05.2021.
//

import Foundation
import SwiftKeychainWrapper

protocol EmailLoginViewModelDelegate {
    func validateLoginData(name: String, pwd: String) -> Bool
    func sendLoginData(name: String, pwd: String)
}

class EmailLoginViewModel {
    
    weak var delegate: EmailLoginViewControllerDelegate?
    var accountService: AccountServiceProtocol
    
    init(accountService: AccountServiceProtocol = AccountService()) {
        self.accountService = accountService
    }
}

extension EmailLoginViewModel: EmailLoginViewModelDelegate{
    
    func validateLoginData(name: String, pwd: String) -> Bool {
        guard name.isValid(value: name, rule: .empty),
              pwd.isValid(value: pwd, rule: .empty) else {
            return false
        }
        return true
    }
    
    func sendLoginData(name: String, pwd: String) {
        let data = Login(name: name, pwd: pwd)
        accountService.login(login: data, completion: {(loginResult, requestError) in
            
            self.delegate?.getLoginResult(status: "OK")
            
            print(loginResult?.access_token ?? "")
            print(loginResult?.refresh_token ?? "")
            print(requestError?.code ?? "")
            print(requestError?.description ?? "")
            //self.delegate?.getLoginResult(status: "ok, email: \(login.)")
        })
    }
}
