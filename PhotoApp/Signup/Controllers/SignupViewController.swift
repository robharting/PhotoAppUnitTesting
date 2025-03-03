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
        
//        #if DEBUG
//        if CommandLine.arguments.contains("-skipSurvey") {
//            print("Skipping survey page")
//        }
//        #endif
//        
//        #if DEBUG
//        if ProcessInfo.processInfo.arguments.contains("-skipSurvey") {
//            print("Skipping survey page")
//        }
//        #endif
        
        
        
        
        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            
            // add a launch environment value
            let signupRUL = ProcessInfo.processInfo.environment["signupUrl"] ??
                SignupConstants.signupURLString
            
            let webservice = SignupWebService(urlString: signupRUL)
            
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
        let alert = UIAlertController(title: "Success", message: "Signup operation was successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "Your request could not be processed at this time", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
}
