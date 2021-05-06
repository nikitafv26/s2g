//
//  ValidatorManagerTests.swift
//  s2gTests
//
//  Created by Nikita Fedorenko on 22.12.2020.
//

import XCTest
@testable import s2g

class ValidatorManagerTests: XCTestCase {

    private var email: String = "valid@email.com"
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmailValidator() throws {
        let emailValidator = EmailValidator()
        
        let testEmail = emailValidator.valid(value: email)
        
        XCTAssertTrue(testEmail)
    }
    
    func testValidatorFactoryShouldReturnCorrectValidatingInstance() throws{
        let validatorFactory = ValidatorFactory(rule: .email)
        let validator = validatorFactory.get()
        
        XCTAssertTrue(validator is EmailValidator)
    }
    
    func testUITextFieldIsValid () throws{
        
        let emailTextField = UITextField()
        emailTextField.text = email
        let testEmail = emailTextField.isValid(value: emailTextField.text!, rule: .email)
        
        XCTAssertTrue(testEmail)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
