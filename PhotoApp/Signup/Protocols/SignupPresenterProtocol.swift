//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Harting, R.P.G. (Rob) on 14/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    
    init(formModelValidaor: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol,  delegate: SignupViewDelegateProtocol)
    
    func processUserSignup(formModel: SignupFormModel)
    
    
    
}
