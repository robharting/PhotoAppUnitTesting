//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Harting, R.P.G. (Rob) on 10/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation

protocol SignupWebServiceProtocol {
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
    
}
