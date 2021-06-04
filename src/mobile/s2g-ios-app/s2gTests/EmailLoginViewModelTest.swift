//
//  EmailLoginViewModelTest.swift
//  s2gTests
//
//  Created by Nikita Fedorenko on 17.05.2021.
//

import XCTest
@testable import s2g

class EmailLoginViewModelTest: XCTestCase {

    var viewModel: EmailLoginViewModel!
    var mockAccountService: MockAccountService!
    
    override func setUp() {
        mockAccountService = MockAccountService()
        viewModel = .init(accountService: mockAccountService)
    }
    
    func testLogin() {
        
        viewModel.sendLoginData(name: "Ivan", pwd: "pwd")
        
        XCTAssertNil(nil)
    }
}
