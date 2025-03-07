//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Harting, R.P.G. (Rob) on 07/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    
    private var formModelValidaor: SignupModelValidatorProtocol!
    private var webservice: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    required init(formModelValidaor: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol,  delegate: SignupViewDelegateProtocol) {
        self.formModelValidaor = formModelValidaor
        self.webservice = webservice
        self.delegate = delegate
        
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidaor.isfFirstNameValid(firstName: formModel.firstName) {
            delegate?.errorHandler(error: SignupError.invalidFirstName)
            return
        }
        
        if !formModelValidaor.isLastNameValid(lastName: formModel.lastName) {
            delegate?.errorHandler(error: SignupError.invalidLastName)
            return
        }
        
        if !formModelValidaor.isEmailValid(email: formModel.email) {
            delegate?.errorHandler(error: SignupError.invalidEmail)
            return
        }
        
        if !formModelValidaor.isPasswordValid(password: formModel.password) {
            delegate?.errorHandler(error: SignupError.invalidPassword)
            return
        }
        
        if !formModelValidaor.doPasswordsMatch(password: formModel.password, confirmPassword: formModel.password) {
            delegate?.errorHandler(error: SignupError.passwordsDoNotMatch)
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        
        webservice.signup(withForm: requestModel) { [weak self] (responseModel, error) in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            
            if let _ = responseModel {
                self?.delegate?.successfulSignup()
                return
            }
        }
        
        
        
    }
    
}
