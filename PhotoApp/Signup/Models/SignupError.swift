//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by Harting, R.P.G. (Rob) on 31/01/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    case invalidFirstName
    case invalidLastName
    case invalidEmail
    case invalidPassword
    case passwordsDoNotMatch
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        case .invalidFirstName,
                .invalidLastName,
                .invalidEmail,
                .invalidPassword,
                .passwordsDoNotMatch:
            return ""
            
        }
    }
    
}
