//
//  BaseElement.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

open class BaseElement<T:ConvertibleFormType & CustomStringConvertible>: Element {
    
    var filters = [Filter] ()
    var validators = [Validator<T>]()
    public var source: ElementDataSource
    
    public init(_ dataSource: ElementDataSource) {
        self.source = dataSource
    }
    
    open func result() -> T? {
        let value = filters.reduce(source.formValue.description, { $0.1.filtere(value: $0.0) } )
        return T.convert(value: value)
    }
    
    open func result(default value: T) -> T {
        return self.result() ?? value
    }
    
    public var errors: [ErrorProtocol] {
        get {
            let value = result()
            return validators.reduce([ErrorProtocol](), { $0.0 + $0.1.validate(value: value)  })
        }
    }
    
    // filters
    open func add(filter:Filter) -> Self {
        _ = remove(filter: filter)
        filters.append(filter)
        return self
    }
    
    open func remove(filter:Filter) -> Self {
        if let index = filters.index(where: { $0 === filter }) {
            filters.remove(at: index)
        }
        return self
    }
    
    // validators
    open func add(validator:Validator<T>) -> Self {
        _ = remove(validator: validator)
        validators.append(validator)
        return self
    }
    
    open func remove(validator:Validator<T>) -> Self {
        if let index = validators.index(where: { $0 === validator }) {
            validators.remove(at: index)
        }
        return self
    }
}
