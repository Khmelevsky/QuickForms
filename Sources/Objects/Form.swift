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
    
    public init(){}
    
    var elements = [Element]()
    
    /// Return form errors
    open var errors: [ErrorProtocol] {
        return elements.reduce([ErrorProtocol](), { $0.0 + $0.1.errors })
    }
    
    /// Return true is form valid
    open func isValid() -> Bool {
        return errors.count == 0
    }
    
    open func add(element:Element) {
        remove(element: element)
        elements.append(element)
    }
    
    open func remove(element:Element) {
        if let index = elements.index(where: { $0 === element }) {
            elements.remove(at: index)
        }
    }
    
    open func removeElements() {
        elements.removeAll()
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
            
        }
    }
    
}

