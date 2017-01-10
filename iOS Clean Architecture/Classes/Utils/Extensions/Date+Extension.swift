//
//  Date+Extension.swift
//
//  Created by hayamin on 1/10/17.
//  Copyright © 2017 in.hayam. All rights reserved.
//

import Foundation

extension Date {
    
    func stringWithFormatter(dateFormat: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
    
    var string: String {
        return stringWithFormatter(dateFormat: "yyyy/MM/dd HH:mm")
    }
    
    var stringDate: String {
        return stringWithFormatter(dateFormat: "yyyy/MM/dd")
    }
    
    var stringTime: String {
        return stringWithFormatter(dateFormat: "HH:mm")
    }
    
    var stringYearMonth: String {
        return stringWithFormatter(dateFormat: "yyyy/MM")
    }
    
    init?(iso8601: String?) {
        self.init()
        
        if iso8601 == nil {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = dateFormatter.date(from: iso8601!) else {
            return nil
        }
        
        self = date
        
    }
    
}
