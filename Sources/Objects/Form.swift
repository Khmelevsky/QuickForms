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
    
    public var errors: [Swift.Error] {
        return self.elements.reduce(Array<Swift.Error>(), { $0.0 + $0.1.errors })
    }
    
    fileprivate(set) var elements = [Element]()
    
    open func isValid() -> Bool {
        return errors.count == 0
    }
}

extension Form {
    
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
    
    open class Error: Swift.Error, LocalizedError {
        var message: String
        var element: Element?
        
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
    }
    
}

