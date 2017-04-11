//
//  CustomValidator.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

extension Validators {
    public static func Custom<T:Equatable>(message:String, validator: @escaping (_ value:T?) -> Bool) -> Validator<T> {
        return CustomValidator(validator: validator, message: message)
    }
}

class CustomValidator<T:Equatable>: Validator<T> {
    
    typealias Clouser = (_ value:T?) -> Bool
    
    var message: String
    var validator: Clouser
    
    init(validator: @escaping Clouser, message:String) {
        self.message = message
        self.validator = validator
    }
    
    override open func validate(value: T?) -> [Swift.Error] {
        return self.validator(value) ? [] : [Form.makeError(message: message)]
    }
    
}
