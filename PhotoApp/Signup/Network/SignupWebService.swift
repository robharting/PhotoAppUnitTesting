//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Harting, R.P.G. (Rob) on 31/01/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation


class SignupWebService {
    
    private var urlSession: URLSession
    private var urlString: String
        
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupFormResponseModel?, SignupErrors?) -> Void) {
        guard let url = URL(string: urlString) else {
            // TODO: create a unit test to test that a specific error message is returned if the URL is nil
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
            // TODO: Write a new unit test to handle and error here
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupFormResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                // TODO: Create a new Unit Test to handle an error here
                //completionHandler(nil, .invalidResponse)
            }
        }
        
        dataTask.resume()
        
        
    }
    
    
}

