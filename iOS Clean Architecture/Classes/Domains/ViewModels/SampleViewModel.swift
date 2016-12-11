//
//  SampleViewModel.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import Foundation

final class SampleViewModel {
    
    var id: UserID?
    var email: Email?
    
    convenience init(id: UserID?, email: Email?) {
        self.init()
        self.id = id
        self.email = email
    }
    
}
