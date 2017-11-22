//
//  Form.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

open class Form {
    
    public init() {}
    
    fileprivate var _elements = [Element]()
    
    open func elements() -> [Element] {
        return _elements
    }
    
    public var errors: [Swift.Error] {
        return self.elements().reduce(Array<Swift.Error>(), { $0 + $1.errors })
    }
    
    open func isValid() -> Bool {
        return errors.count == 0
    }
}

extension Form {
    
    open func add(element:Element) {
        remove(element: element)
        _elements.append(element)
    }
    
    open func remove(element:Element) {
        if let index = _elements.index(where: { $0 === element }) {
            _elements.remove(at: index)
        }
    }
    
    open func removeElements() {
        _elements.removeAll()
    }
}



// Error
extension Form {
    
    public static func makeError(message:String) -> Error {
        let info: [String : Any] = [NSLocalizedDescriptionKey:message]
        return NSError(domain: "queckForms", code: 0, userInfo: info)
    }
    
}

