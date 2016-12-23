//
//  ConvertibleFormType.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation


public protocol ConvertibleFormType {
    static func convert(value:String) -> Self?
}

extension Int: ConvertibleFormType {
    
    public static func convert(value: String) -> Int? {
        return Int(value)
    }
    
}

extension UInt: ConvertibleFormType {
    
    public static func convert(value: String) -> UInt? {
        return UInt(value)
    }
    
}

extension Double: ConvertibleFormType {
    
    public static func convert(value: String) -> Double? {
        return Double(value)
    }
    
}

extension Float: ConvertibleFormType {
    
    public static func convert(value: String) -> Float? {
        return Float(value)
    }
    
}

extension Bool: ConvertibleFormType {
    
    public static func convert(value: String) -> Bool? {
        return value == "true" ? true : false
    }
    
}

extension String: ConvertibleFormType {
    
    public static func convert(value: String) -> String? {
        return value
    }
    
}
