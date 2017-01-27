//
//  Form.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

public typealias ErrorProtocol = Error


open class Form {
    
    public init() {}
    
    var errors: [ErrorProtocol] {
        return self.elements().reduce([ErrorProtocol](), { $0.0 + $0.1.errors })
    }
    
    fileprivate var _elements = [Element]()
    
    open func elements() -> [Element] {
        return _elements
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
    
    open class Error: ErrorProtocol, LocalizedError {
        var message: String
        
        public var localizedDescription: String {
            get {
                return message
            }
        }
        
        public var errorDescription: String? {
            get {
                return message
            }
        }
        
        public init(message:String) {
            self.message = message
        }
        
        public struct Messages {
            public static var equal = "Field should be equal to %@"
            public static var required = "Field is required"
            public static var regexValueNil = "Value is nil"
            public static var regexPatternError = "Pattern error"
            public static var email = "Invalid email"
            
        }
    }
    
}

