//
//  SampleEntity.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import Himotoki
import RealmSwift

final class SampleEntity: Object {
    
    dynamic var id: UserID?
    dynamic var email: Email?
    
    convenience init(id: UserID?, email: Email?) {
        self.init()
        self.id = id
        self.email = email
    }
    
    // MARK: Realm.Object
    override static func primaryKey() -> UserID {
        return "id"
    }
    
}

extension SampleEntity: Decodable {
    
    // MARK: Decodable
    static func decode(_ e: Extractor) throws -> SampleEntity {
        return SampleEntity(
            id: try e <|? "id",
            email: try e <|? "email"
        )
    }
}
