//
//  UISwitch.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import UIKit

extension UISwitch: ElementDataSource {
    
    public var formValue: CustomStringConvertible {
        get{
            return isOn
        }
    }
    
    public func toElement() -> BaseElement<Bool> {
        return BaseElement<Bool>(self)
    }
}
