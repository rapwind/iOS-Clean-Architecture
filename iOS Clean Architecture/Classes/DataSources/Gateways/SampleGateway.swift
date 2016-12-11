//
//  SampleGateway.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import RealmSwift

class SampleGateway: RealmDriver, BaseGatewayProtocol {
    
    static let shared = SampleGateway()
    private override init() {
        super.init()
    }
    
    func getByID(id: String) -> SampleEntity? {
        let models = super.realm.objects(SampleEntity.self).filter("id = '\(id)'")
        if models.count > 0 {
            return models[0]
        } else {
            return nil
        }
    }
    
    func getAll() -> Results<SampleEntity>? {
        return super.realm.objects(SampleEntity.self).sorted(byProperty: "id")
    }
    
}
