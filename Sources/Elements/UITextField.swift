//
//  UITextField.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import UIKit

extension UITextField: ElementDataSource {
    
    public var formValue: CustomStringConvertible {
        get{
            return text!
        }
    }
    
    public func toElement() -> BaseElement<String> {
        return BaseElement<String>(self)
    }
    
}
