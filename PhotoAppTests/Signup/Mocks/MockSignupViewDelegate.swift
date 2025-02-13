//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Harting, R.P.G. (Rob) on 10/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter  = 0
    var signupError: SignupError?
    
    func successfulSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoApp.SignupError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
        
    }
    
    
    
    
}
