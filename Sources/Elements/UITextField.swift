//
//  UITextField.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import UIKit

extension UITextField: FieldDataSourceProtocol {
    public var value: CustomStringConvertible {
        get {
            return text!
        }
        set {
            text = newValue.description
        }
    }
}
