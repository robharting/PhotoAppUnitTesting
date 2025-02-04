//
//  SignupWebserviceTests.swift
//  PhotoAppTests
//
//  Created by Harting, R.P.G. (Rob) on 31/01/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupWebService_WhenGivenSuccesfullResponse_ReturnsSuccess() {
        
        // Arrange
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
                
        let sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        
        let signupFormRequestModel = SignupFormRequestModel(firstName: "Rob", lastName: "Harting", email: "rob@harting.nl", password: "12345678")
        
        let expectation = self.expectation(description: "Signup WebService Response Expectation")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupFormResponseModel, error) in
          
            // Assert
            // "{\"status\":\"ok\"}"
            XCTAssertEqual(signupFormResponseModel?.status, "ok")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
        
        
        
        

    }

}
