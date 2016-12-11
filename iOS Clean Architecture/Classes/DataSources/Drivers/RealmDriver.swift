//
//  RealmDriver.swift
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import RealmSwift

class RealmDriver {
    
    let realm: Realm
    
    init() {
        let config = Realm.Configuration(schemaVersion: 0)
        Realm.Configuration.defaultConfiguration = config
        realm = try! Realm()
    }
    
    func set(data: Object) -> Bool {
        do {
            try realm.write {
                realm.add(data, update: true)
            }
            return true
        } catch {
            // TODO: Add Error Logger
        }
        return false
    }
    
    func delete(data: Object) -> Bool {
        do {
            try realm.write {
                realm.delete(data)
            }
            return true
        } catch {
            // TODO: Add Error Logger
        }
        return false
    }
    
}
