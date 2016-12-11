//
//  BaseRequest.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import APIKit
import Himotoki

protocol BaseRequest: Request {
}

extension BaseRequest {
    
    // BaseURL
    var baseURL: URL {
        let urlString = "https://demo.sample.com/"
        return URL(string: urlString)!
    }
    
    // Timeout
    func intercept(urlRequest: URLRequest) throws -> URLRequest {
        
        var _urlRequest = urlRequest
        
        switch self.method {
        case .post, .put, .delete:
            // Write Requests Timeout Interval
            _urlRequest.timeoutInterval = 30.0
        default:
            // Read Requests Timeout Interval
            _urlRequest.timeoutInterval = 15.0
        }
        
        return _urlRequest
    }
    
}

extension BaseRequest where Response: Decodable {
    // MARK: Decodable
    func response(from: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try decodeValue(from)
    }
}
