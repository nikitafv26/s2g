//
//  CreateAccountViewModel.swift
//  s2g
//
//  Created by Nikita Fedorenko on 13.05.2021.
//

import Foundation

protocol CreateAccountViewModelDelegate {
    func validateRegisterData(name: String, email: String, pwd: String) -> Bool
    func sendRegisterData(name: String, email: String, pwd: String)
}

class CreateAccountViewModel{
    
    weak var delegate: CreateAccountViewControllerDelegate?
    private var accountService: AccountService
    
    init() {
        accountService = AccountService()
    }
}

extension CreateAccountViewModel : CreateAccountViewModelDelegate{
    
    func validateRegisterData(name: String, email: String, pwd: String) -> Bool {
        guard name.isValid(value: name, rule: .empty),
              email.isValid(value: email, rule: .email),
              pwd.isValid(value: pwd, rule: .empty) else {
            return false
        }
        return true
    }
    
    func sendRegisterData(name: String, email: String, pwd: String) {
        let data = Register(name: name, email: email, pwd: pwd)
        accountService.create(register: data, completion: {(register) in
            self.delegate?.getRegisterResult(status: "ok, email: \(register.email)")
        })
    }
}
