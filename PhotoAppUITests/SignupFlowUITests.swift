//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Harting, R.P.G. (Rob) on 28/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import XCTest

final class SignupFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testSignupViewController_whenviewLoaded_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let firstName = app.textFields["firstName"]
        let lastName = app.textFields["lastName"]
        let email = app.textFields["emailAddress"]
        let password = app.secureTextFields["password"]
        let repeatPassword = app.secureTextFields["repeatPassword"]
        let signupButton = app.buttons["signupButton"]
        
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interaction")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interaction")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interaction")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interaction")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat Password UITextField is not enabled for user interaction")
        XCTAssertTrue(signupButton.isEnabled, "The Signup button is not enabled for user interaction")
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
