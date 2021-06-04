//
//  EmailLoginViewController.swift
//  s2g
//
//  Created by Nikita Fedorenko on 08.05.2021.
//

import UIKit

protocol EmailLoginViewControllerDelegate: AnyObject {
    func getLoginResult(status: String)
}

class EmailLoginViewController: UIViewController {

    private var emailLoginViewModel = EmailLoginViewModel()
    
    @IBOutlet weak var nameTextField: LoginTextField!
    @IBOutlet weak var pwdTextFiled: LoginTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLoginViewModel.delegate = self
        dismissKeybord()
    }
}

extension EmailLoginViewController: EmailLoginViewControllerDelegate{
    
    func getLoginResult(status: String) {
        print("Result from VM: \(status)")
    }
}

//MARK: Private Extension
private extension EmailLoginViewController{
    
    @IBAction func login(_ sender: UIButton) {
        
        if !emailLoginViewModel.validateLoginData(name: nameTextField.text!, pwd: pwdTextFiled.text!){
            let alert = UIAlertController(title: "Login", message: "incorrect user data", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        emailLoginViewModel.sendLoginData(name: nameTextField.text!, pwd: pwdTextFiled.text!)
    }
    
    func dismissKeybord() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
