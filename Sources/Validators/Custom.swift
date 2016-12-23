//
//  Custom.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

open class CustomValidator<T:Equatable>: Validator<T> {
    
    public typealias Clouser = (_ value:T?) -> Bool
    
    var message: String
    var validator: Clouser
    
    public init(message:String, validator: @escaping Clouser) {
        self.message = message
        self.validator = validator
    }
    
    override open func validate(value: T?) -> [ErrorProtocol] {
        return self.validator(value) ? [] : [Form.Error(message: Form.Error.Messages.regexPatternError)]
    }
    
}
