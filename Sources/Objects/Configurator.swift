//
//  Configurator.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

open class Configurator<T:ConfiguratorModel> {
    
    let model = T()
    public init() {}
    
    open func configure(configure:(T)->()) -> T {
        configure(model)
        for variable in model.variables() {
            model.form.add(element: variable)
        }
        return model
    }
}
