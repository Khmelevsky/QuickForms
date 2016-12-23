//
//  ConfiguratorModel.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

open class ConfiguratorModel {
    public required init() {}
    
    var form = Form()
    
    open func variables() -> [VariableElement] {
        return []
    }
    
    /// Return form errors
    open var errors: [ErrorProtocol] {
        return form.errors
    }
    
    /// Return true is form valid
    open func isValid() -> Bool {
        return errors.count == 0
    }
}
