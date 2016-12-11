//
//  DataSourceErrors.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import Foundation

public enum DataSourceError: Error {
    case failGetRequest
    case failPostRequest
    case failPutRequest
    case failDeleteRequest
    case failSaveToDB
    case failReadFromDB
    case failRemoveFromDB
    case failRequestInvalid
    case failRequestTimeout
}
