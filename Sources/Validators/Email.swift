//
//  Email.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 23.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

open class EmailValidator: RegexValidator {
    
    public init() {
        super.init(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", errorMessage: Form.Error.Messages.email)
    }
    
}
