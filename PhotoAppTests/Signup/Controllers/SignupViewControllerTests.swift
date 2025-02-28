//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Harting, R.P.G. (Rob) on 13/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import XCTest
@testable import PhotoApp

final class SignupViewControllerTests: XCTestCase {
    
    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }
    
    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws{
        // Arrange
        // Act
        // Assert
        
        // use XCTUnrap to test if IBOutlet is there
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "The FirstNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "The LastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The EmailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The EmailTextField is not connected to an IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "The FirstNameTextField is not RepeatPasswordTextField to an IBOutlet")
        
        XCTAssertEqual(firstNameTextField.text, "", "First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(lastNameTextField.text, "", "Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "", "Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(repeatPasswordTextField.text, "", "Repeat Password text field was not empty when the view controller initially loaded")
    }
    
    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        // Arrange
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "SignupButton is not connected to an referencing outlet")
                
        // Act
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button does not have any actions assigned to it")
        
        // Assert
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
        
    }
    
    func testViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        // Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let mocksignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidaor: mockSignupModelValidator, webservice: mocksignupWebService, delegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        
        // Act
        sut.signupButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The processUserSignupCalled() method was not called on a Presenter object when the signup button was tapped in a SignupViewController")
    }
    
    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField is not connected")
        
        XCTAssertEqual(emailTextField.textContentType, UITextContentType.emailAddress, "Email address UITextField does not have an Email address Content Type set")
        // or a shorter version
        XCTAssertEqual(emailTextField.textContentType, .emailAddress, "Email address UITextField does not have an Email address Content Type set")
    }
    
    
    func testEmailTextFiels_WhenCreated_HasEmailAddressKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField is not connected")
        
        XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress, "Email address UITextField does not have an Email  Keyboard Type set")
        
    }
    
    func testEmailTextField_WhenCreated_IsSecureTextField() throws {
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The Password UITextField is not connected")
        
        XCTAssertTrue(passwordTextField.isSecureTextEntry, "Password UITextField does not have Secure Text Entry field")
    }
    
}
