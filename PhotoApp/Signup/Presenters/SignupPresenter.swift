//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Harting, R.P.G. (Rob) on 07/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidaor: SignupModelValidatorProtocol!
    
    init(formModelValidaor: SignupModelValidatorProtocol) {
        self.formModelValidaor = formModelValidaor
        
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidaor.isfFirstNameValid(firstName: formModel.firstName) {
            return 
        }
        
        if !formModelValidaor.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidaor.isEmailValid(email: formModel.email) {
            return
        }
        
        if !formModelValidaor.isPasswordValid(password: formModel.password) {
            return
        }
        
        if !formModelValidaor.doPasswordsMatch(password: formModel.password, confirmPassword: formModel.password) {
            return
        }
            
        
    }
    
}
