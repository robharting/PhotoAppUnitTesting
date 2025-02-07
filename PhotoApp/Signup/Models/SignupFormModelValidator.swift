//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Harting, R.P.G. (Rob) on 28/01/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    func isfFirstNameValid(firstName: String) -> Bool{
        
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }

        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        
        var returnValue = true
        
        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isEmailValid(email: String) -> Bool{
        
        var returnValue = true
        
        if !email.contains("@") {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isPasswordValid(password: String) -> Bool {
        
        var returnValue = true
        
        if password.count < SignupConstants.passwordMinLength || password.count > SignupConstants.passwordMaxLength{
            returnValue = false
        }
        
        return returnValue
    }
    
    func doPasswordsMatch(password: String, confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    
}
