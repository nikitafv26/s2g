//
//  LoginViewController.swift
//  s2g
//
//  Created by Nikita Fedorenko on 26.10.2020.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    
    let btnLoginAttributes: [NSAttributedString.Key: Any] = [
        .underlineStyle: NSUnderlineStyle.single.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributedString = NSMutableAttributedString(string: "Log in", attributes: btnLoginAttributes)
        btnLogin.setAttributedTitle(attributedString, for: .normal)
    }

}
