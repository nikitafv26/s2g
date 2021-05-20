//
//  CreateAccountViewController.swift
//  s2g
//
//  Created by Nikita Fedorenko on 26.10.2020.
//

import UIKit

protocol CreateAccountViewControllerDelegate : AnyObject {
    func getRegisterResult(status: String)
}

class CreateAccountViewController: UIViewController {

    private var createAccountViewModel = CreateAccountViewModel()
    
    @IBOutlet weak var nameTextField: LoginTextField!
    @IBOutlet weak var emailTextField: LoginTextField!
    @IBOutlet weak var pwdTextField: LoginTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountViewModel.delegate = self
    }
}

extension CreateAccountViewController : CreateAccountViewControllerDelegate{
    func getRegisterResult(status: String) {
        print("Result from VM: \(status)")
    }
}

//MARK: Private Extension
private extension CreateAccountViewController {
    
    @IBAction func createAccount(_ sender: UIButton) {
        
        if !createAccountViewModel.validateRegisterData(name: nameTextField.text!, email: emailTextField.text!, pwd: pwdTextField.text!){
            let alert = UIAlertController(title: "Creating account", message: "incorrect user data", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        createAccountViewModel.sendRegisterData(name: nameTextField.text!, email: emailTextField.text!, pwd: pwdTextField.text!)
    }
}
