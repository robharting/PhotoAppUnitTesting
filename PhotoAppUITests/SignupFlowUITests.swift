//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Harting, R.P.G. (Rob) on 28/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import XCTest

final class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        firstName = app.textFields["firstName"]
        lastName = app.textFields["lastName"]
        email = app.textFields["emailAddress"]
        password = app.secureTextFields["password"]
        repeatPassword = app.secureTextFields["repeatPassword"]
        signupButton = app.buttons["signupButton"]
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
        
        
    }
    
    @MainActor
    func testSignupViewController_whenviewLoaded_RequiredUIElementsAreEnabled() throws {
        
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interaction")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interaction")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interaction")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interaction")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat Password UITextField is not enabled for user interaction")
        XCTAssertTrue(signupButton.isEnabled, "The Signup button is not enabled for user interaction")
    }
    
    @MainActor
    func testViewController_WhenInvalidFormSubmitted_PresentErrorAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("S")
        
        lastName.tap()
        lastName.typeText("K")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("123456")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        
        // Act
        signupButton.tap()
        
        // Assert
        //XCTAssertTrue(app.alerts["errorAlertDialog"].exists, "An Error Alert dialog was not presented when invalid signup form was submitted")
        // or use and waitforExistence instead
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error Alert dialog was not presented when invalid signup form was submitted")
    }
    
    @MainActor
    func testViewController_WhenValidFormSubmitted_PresentSuccessAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("Rob")
        
        lastName.tap()
        lastName.typeText("Harting")
        
        email.tap()
        email.typeText("test@test.com")
        
        password.tap()
        password.typeText("12345678")
        
        repeatPassword.tap()
        repeatPassword.typeText("12345678")
        
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 3), "An Success Alert dialog was not presented when valid signup form was submitted")
    }
    
    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
