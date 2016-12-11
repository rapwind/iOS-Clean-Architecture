//
//  BaseGatewayProtocol.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import RealmSwift

protocol BaseGatewayProtocol {
    
    associatedtype ObjectType: Object
    
    func getByID(id: String) -> ObjectType?
    func getAll() -> Results<ObjectType>?
    func set(data: Object) -> Bool
    func delete(data: Object) -> Bool
}
