//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Harting, R.P.G. (Rob) on 13/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            let webservice = SignupWebService(urlString: SignupConstants.signupURLString)
                        
            signupPresenter = SignupPresenter(formModelValidaor: signupModelValidator, webservice: webservice, delegate: self)
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let signupFormModel = SignupFormModel(
            firstName: firstNameTextField.text ?? "",
            lastName: lastNameTextField.text ?? "",
            email: emailTextField.text ?? "",
            password: passwordTextField.text ?? "",
            recordPassword: repeatPasswordTextField.text ?? "")
        
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
    
    
}

extension SignupViewController : SignupViewDelegateProtocol {
    func successfulSignup() {
        // TODO
    }
    
    func errorHandler(error: SignupError) {
        // TODO
    }
}
