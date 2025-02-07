//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Harting, R.P.G. (Rob) on 07/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isfFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isEmailValid(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordsMatch(password: String, confirmPassword: String) -> Bool
}
