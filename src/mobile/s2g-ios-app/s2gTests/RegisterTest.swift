//
//  RegisterTest.swift
//  s2gTests
//
//  Created by Nikita Fedorenko on 22.12.2020.
//

import XCTest
@testable import s2g

class RegisterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRegisterInit() throws {
        let name: String = "Ivan"
        let email: String = "ivan@apple.com"
        let pwd: String = "pwd"
        
        let register = Register(name: name, email: email, pwd: pwd)
        
        XCTAssertEqual(register.name, name)
        XCTAssertEqual(register.email, email)
        XCTAssertEqual(register.pwd, pwd)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
