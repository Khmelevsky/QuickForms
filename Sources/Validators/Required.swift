//
//  Required.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

extension Validators {
    public static func Required<T:Equatable>(message:String = "Field is required") -> Validator<T> {
        return RequiredValidator<T>(message:message)
    }
}

class RequiredValidator<T:Equatable>: Validator<T> {
    
    private var message:String!
    
    public init(message:String) {
        self.message = message
    }
    
    override open func validate(value: T?) -> [Swift.Error] {
        var valid = true
        
        if value == nil {
            valid = false
        } else if let str = value as? String, str.count == 0 {
            valid = false
        }
        
        return valid ? [] : [Form.makeError(message: message)]
    }
    
}


