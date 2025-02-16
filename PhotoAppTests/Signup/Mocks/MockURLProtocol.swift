//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by Harting, R.P.G. (Rob) on 03/02/2025.
//  Copyright © 2025 Sergey Kargopolov. All rights reserved.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        if let error = MockURLProtocol.error {
            let stubNSError = NSError(domain: "StubNSError", code: -99, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
            self.client?.urlProtocol(self, didFailWithError: stubNSError)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
            
        self.client?.urlProtocolDidFinishLoading(self)
    }
        
    override func stopLoading() {}
    

}

