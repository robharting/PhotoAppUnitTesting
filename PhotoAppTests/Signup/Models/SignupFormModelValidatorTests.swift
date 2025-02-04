//
//  SignupFormValidator.swift
//  PhotoAppTests
//
//  Created by Harting, R.P.G. (Rob) on 28/01/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    
    // sut means system under test
    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() throws {
    
        // Given - Arrange
        
        // When - Act
        let isFirstNameValid = sut.isfFirstNameValid(firstName: "Rob")
        
        // Then - Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid should have returned TURE for a valid first name but returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenNoFirstNameProvided_ShouldReturnFalse() throws {
    
        // Given - Arrange
        
        // sut means system under test
               
        // When - Act
        let isFirstNameValid = sut.isfFirstNameValid(firstName: "")
        
        // Then - Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid should have returned FALSE for a no / empty first name but returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse()  {
        // Arrange
                      
        // Act
        let tooShortFirstNameValid = sut.isfFirstNameValid(firstName: "R")
               
        // Assert
        XCTAssertFalse(tooShortFirstNameValid, "The isFirstNameValid should have returned FALSE for a first name that is shorter then \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isfFirstNameValid(firstName: "RobRobRobRob")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid should have returned FALSE for a first name that is longer then (\(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        
        // Arrange
        
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Harting")
        
        // Then - Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid should have returned TURE for a valid last name but returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse()  {
        // Arrange
                      
        // Act
        let tooShortLastNameValid = sut.isLastNameValid(lastName: "Haa")
               
        // Assert
        XCTAssertFalse(tooShortLastNameValid, "The tooShortLastNameValid should have returned FALSE for a first name that is shorter then \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "HartingHartingHartingHartingHarting")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid should have returned FALSE for a last name that is longer then \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenValidEmailNameProvided_ShouldReturnTrue() {
        // Arrange
        
        // Act
        let isEmailValid = sut.isEmailValid(email: "johndoe@example.com")
        
        // Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid should have returned TRUE for a valid email address but it has returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenInValidEmailNameProvided_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isEmailValid = sut.isEmailValid(email: "johndoeexample.com")
        
        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid should have returned FALSE for a invalid email address but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "Pass")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid should have returned FALSE for a password that is shorter then \(SignupConstants.passwordMinLength) but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "Password123444444444444")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid should have returned TRUE for a password that is longer then  \(SignupConstants.passwordMaxLength) but it has returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // Arrange
        
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "Password12344", confirmPassword: "Password12344")
    
        // Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch should have returned TRUE when passwords match but it has returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "Password12344", confirmPassword: "Passw0rd12344")
    
        // Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch should have returned FALSE when passwords do not match but it has returned TRUE")
        
    }

}
