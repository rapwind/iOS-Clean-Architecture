//
//  GetSampleRequest.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import APIKit
import Himotoki

struct GetSampleRequest: BaseRequest {
    typealias Response = GetSampleResponse
    
    let id: UserID
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/users/" + id
    }
}
