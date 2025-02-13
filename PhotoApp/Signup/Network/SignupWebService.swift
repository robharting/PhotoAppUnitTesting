//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Harting, R.P.G. (Rob) on 31/01/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation


class SignupWebService: SignupWebServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String
        
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignupError.invalidRequestURLString)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
//        do {
//            let jsonData = try JSONEncoder().encode(formModel)
//            request.httpBody = jsonData
//        } catch {
//            
//        }
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if let requestError = error {
                completionHandler(nil, SignupError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                completionHandler(nil, SignupError.invalidResponseModel)
            }
        }
        
        dataTask.resume()
        
        
    }
    
    
}

