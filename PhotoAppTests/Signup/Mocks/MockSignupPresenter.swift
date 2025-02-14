//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Harting, R.P.G. (Rob) on 14/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidaor: any SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        // TODO
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
    
    
    
    
}
