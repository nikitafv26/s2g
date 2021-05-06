//
//  ValidatorManager.swift
//  s2g
//
//  Created by Nikita Fedorenko on 22.12.2020.
//

import Foundation
import UIKit

public enum ValidatorRule {
    case email
    case pwd
    case empty
}

public protocol Validating{
    func valid(value: String) -> Bool
}

public extension UITextField{
    func isValid(value: String, rule: ValidatorRule) -> Bool {
        let validatorFactory = ValidatorFactory(rule: rule)
        let validator = validatorFactory.get()
        return validator.valid(value: value)
    }
}

public class Validator: Validating{
    
    private let validator: Validating
    
    init(validator: Validating) {
        self.validator = validator
    }
    
    public func valid(value: String) -> Bool {
        return validator.valid(value: value)
    }
}

public class ValidatorFactory{
    
    private let rule: ValidatorRule
    
    init(rule: ValidatorRule) {
        self.rule = rule
    }
    
    public func get() -> Validating{
        switch rule {
        case .email:
            return EmailValidator()
        case .empty:
            return EmptyValidator()
        default:
            return DefaultValidator()
        }
    }
}

public class EmailValidator: Validating{
   
    public func valid(value: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return testEmail.evaluate(with: value)
    }
}

public class EmptyValidator: Validating{
    public func valid(value: String) -> Bool {
        guard value != "" else {
            return false
        }
        return true
    }
}

public class DefaultValidator: Validating{
    public func valid(value: String) -> Bool {
        return true
    }
}


