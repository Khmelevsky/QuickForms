//
//  Required.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

extension Validators {
    public static func Required<T:Equatable>() -> Validator<T> {
        return RequiredValidator<T>()
    }
}

class RequiredValidator<T:Equatable>: Validator<T> {
    
    public override init() {}
    
    override open func validate(value: T?) -> [ErrorProtocol] {
        var valid = true
        
        if value == nil {
            valid = false
        } else if let str = value as? String, str.characters.count == 0 {
            valid = false
        }
        
        return valid ? [] : [Form.Error(message: Form.Error.Messages.required)]
    }
    
}


