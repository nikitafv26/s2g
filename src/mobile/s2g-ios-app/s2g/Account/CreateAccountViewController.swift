//
//  CreateAccountViewController.swift
//  s2g
//
//  Created by Nikita Fedorenko on 26.10.2020.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var nameTextField: LoginTextField!
    @IBOutlet weak var emailTextField: LoginTextField!
    @IBOutlet weak var pwdTextField: LoginTextField!
    
    var accountService = AccountService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: Private Extension
private extension CreateAccountViewController {
    
    @IBAction func createAccount(_ sender: Any) {
        
        let user = User(name: nameTextField.text!, email: emailTextField.text!, password: pwdTextField.text!)
        
        if !validateInputData(user: user) {
            let alert = UIAlertController(title: "Creating account", message: "incorrect user data", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        
        accountService.create(user, completion: {(user) in
            print(user.name)
        })
    }
    
    func validateInputData(user: User) -> Bool {
        guard
            nameTextField.isValid(value: nameTextField.text!, rule: .empty),
            emailTextField.isValid(value: emailTextField.text!, rule: .email),
            pwdTextField.isValid(value: pwdTextField.text!, rule: .empty)
        else{ return false }
        return true
    }
}
