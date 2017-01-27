//
//  Validator.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

final public class Validators {}

open class Validator<T> {
    open func validate(value:T?) -> [Error] {
        return []
    }
}
