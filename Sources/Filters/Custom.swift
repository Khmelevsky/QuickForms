//
//  Custom.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 15.02.17.
//  Copyright © 2017 Alexander Khmelevsky. All rights reserved.
//

import Foundation

extension Filters {
    
    public static func Custom<T:FormSupportedTypeProtocol>(_ closure:@escaping (T?) -> T?) -> Filter<T> {
        return CustomFilter<T>(closure: closure)
    }
    
}

class CustomFilter<T:FormSupportedTypeProtocol>: Filter<T> {
    
    var closure: (T?) -> T?
    
    init(closure:@escaping (T?) -> T?) {
        self.closure = closure
    }
    
    override func filter(value: T?) -> T? {
        return closure(value)
    }
}
