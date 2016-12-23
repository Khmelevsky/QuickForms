//
//  Variable.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

open class Variable<T:ConvertibleFormType & CustomStringConvertible>: BaseElement<T>, VariableElement {
    
    public required init(){
        super.init(EmptySource())
    }
    
    open func bindTo(element:Element) {
        self.source = element.source
    }
    
}

class EmptySource: ElementDataSource {
    
    public var formValue: CustomStringConvertible {
        get{
            return ""
        }
    }
}
