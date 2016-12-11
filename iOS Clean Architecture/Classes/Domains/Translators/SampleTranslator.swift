//
//  SampleTranslator.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import Foundation

class SampleTranslator {
    
    static func generateModel(_ entity: SampleEntity) -> SampleViewModel {
        let vm: SampleViewModel = SampleViewModel()
        vm.id = entity.id
        vm.email = entity.email
        
        return vm
    }
    
}
