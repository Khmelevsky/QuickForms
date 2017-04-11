//
//  Equal.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

extension Validators {
    public static func Equal<T:Equatable>(to value: T, message:String) -> Validator<T> {
        return EqualValidator<T>(to: value, message: message)
    }
}

class EqualValidator<T:Equatable>: Validator<T> {
    
    let value: T
    private var message:String!
    
    init(to value: T,message:String) {
        self.value = value
        self.message = message
    }
    
    override open func validate(value: T?) -> [Swift.Error] {
        return self.value == value ? [] : [Form.makeError(message: message)]
    }
}
