//
//  Validator.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

open class Validator<T> {
    
    public init() {}
    
    open func validate(value:T?) -> [ErrorProtocol] {
        return []
    }
    
}
