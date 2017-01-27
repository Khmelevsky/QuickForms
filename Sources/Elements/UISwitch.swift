//
//  UISwitch.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import UIKit

extension UISwitch: FieldDataSourceProtocol {
    public var value: CustomStringConvertible {
        get {
            return isOn
        }
        set {
            isOn = Bool(formSupportedType: newValue) ?? false
        }
    }
}
