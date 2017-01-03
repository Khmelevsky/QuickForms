//
//  Equal.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

extension Validators {
    public static func Equal<T:Equatable>(to value: T) -> Validator<T> {
        return EqualValidator<T>(to: value)
    }
}

class EqualValidator<T:Equatable>: Validator<T> {
    
    let value: T
    
    init(to value: T) {
        self.value = value
    }
    
    override open func validate(value: T?) -> [ErrorProtocol] {
        return self.value == value ? [] : [Form.Error(message: String(format: Form.Error.Messages.equal, "\(self.value)"))]
    }
}
