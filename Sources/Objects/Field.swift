//
//  BaseElement.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation


public class Field<T:FormSupportedTypeProtocol>: Element {
    
    // Element
    public var errors: [Error] {
        get {
            return _validators.reduce([Error](), { $0 + $1.validate(value: self.value()) })
        }
    }
    
    fileprivate(set) var _validators: [Validator<T>] = []
    fileprivate(set) var _filters: [Filter<T>] = []
    // source
    open private(set) weak var source: FieldDataSourceProtocol!
    
    public init(){}
    
    public convenience init(source:FieldDataSourceProtocol) {
        self.init()
        self.source = source
    }
    
    public func bind(to source:FieldDataSourceProtocol) {
        self.source = source
    }
    
    // value
    public func value() -> T? {
        if source == nil {
            assertionFailure("source is nil, need use bind(to:)")
        }
        return _filters.reduce(T(formSupportedType:source.value), { $1.filter(value: $0) })
    }
    
    public func value(default value:T) -> T {
        guard let current = self.value() as? String else {
            return self.value() ?? value
        }
        return !current.isEmpty ? current as! T : value
    }
    
}


// MARK: - Filters controll
extension Field {
    
    public func add(filter:Filter<T>) -> Self {
        _ = remove(filter: filter)
        _filters.append(filter)
        return self
    }
    
    public func remove(filter:Filter<T>) -> Self {
        if let index = _filters.index(where: { $0 === filter }) {
            _filters.remove(at: index)
        }
        return self
    }
    
    public func removeFilters() {
        _filters.removeAll()
    }
}

// MARK: - Validators controll
extension Field {
    
    public func add(validator:Validator<T>) -> Self {
        _ = remove(validator: validator)
        _validators.append(validator)
        return self
    }
    
    public func remove(validator:Validator<T>) -> Self {
        if let index = _validators.index(where: { $0 === validator }) {
            _validators.remove(at: index)
        }
        return self
    }
    
    public func removeValidators() {
        _validators.removeAll()
    }
}

public protocol FieldDataSourceProtocol: class {
    var value: CustomStringConvertible { get set }
}

extension FieldDataSourceProtocol {
    public func toElement<T:FormSupportedTypeProtocol>() -> Field<T> {
        return Field<T>(source:self)
    }
}
