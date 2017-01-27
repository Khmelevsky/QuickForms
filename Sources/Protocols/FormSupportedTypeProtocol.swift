//
//  ConvertibleFormType.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation


public protocol FormSupportedTypeProtocol: CustomStringConvertible {
    init?(formSupportedType value:CustomStringConvertible)
}


extension String: FormSupportedTypeProtocol {
    public init?(formSupportedType value: CustomStringConvertible) {
        self.init(value.description)
    }
}
extension Int: FormSupportedTypeProtocol {
    public init?(formSupportedType value: CustomStringConvertible) {
        self.init(value.description.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
    }
}
extension Float: FormSupportedTypeProtocol {
    public init?(formSupportedType value: CustomStringConvertible) {
        self.init(value.description.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
    }
}
extension Double: FormSupportedTypeProtocol {
    public init?(formSupportedType value: CustomStringConvertible) {
        self.init(value.description.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
    }
}
extension UInt: FormSupportedTypeProtocol {
    public init?(formSupportedType value: CustomStringConvertible) {
        self.init(value.description.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
    }
}
extension Bool: FormSupportedTypeProtocol {
    public init?(formSupportedType value: CustomStringConvertible) {
        self.init(value.description)
    }
}
