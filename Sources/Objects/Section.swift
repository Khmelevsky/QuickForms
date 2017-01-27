//
//  BaseElement.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

open class Section: Element {
    
    var _elements = [Element]()
    
    public init() {}
    
    public var errors: [Error] {
        get {
            return _elements.reduce([Error](), { $0.0 + $0.1.errors })
        }
    }
    
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



