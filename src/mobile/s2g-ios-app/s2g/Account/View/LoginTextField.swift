//
//  LoginTextField.swift
//  s2g
//
//  Created by Nikita Fedorenko on 23.10.2020.
//

import UIKit

@IBDesignable
class LoginTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.backgroundColor = UIColor(red: 1, green: 190 / 255, blue: 0, alpha: 40 / 100).cgColor
        self.layer.borderWidth = 1
        self.layer.borderColor  = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        self.layer.cornerRadius = 9
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

}
