//
//  Regex.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

extension Validators {
    public static func RegEx(pattern: String, message: String, configuration:((_ options:inout NSRegularExpression.Options, _ matchingOptions:inout NSRegularExpression.MatchingOptions)->())? = nil) -> Validator<String> {
        return RegexValidator(pattern: pattern, message: message, configuration: configuration)
    }
}


class RegexValidator: Validator<String> {
    
    var pattern:String
    var message:String
    
    var options:NSRegularExpression.Options = []
    var matchingOptions: NSRegularExpression.MatchingOptions = []
    
    init(pattern: String, message: String, configuration:((_ options:inout NSRegularExpression.Options, _ matchingOptions:inout NSRegularExpression.MatchingOptions)->())? = nil) {
        self.pattern = pattern
        self.message = message
        configuration?(&options,&matchingOptions)
    }
    
    override open func validate(value: String?) -> [Swift.Error] {
        guard let value = value else {
            assertionFailure("Add requared validator")
            return []
        }
        if let regex =  try? NSRegularExpression(pattern: pattern, options: options) {
            return regex.firstMatch(in: value, options: matchingOptions, range: NSRange(location: 0, length: (value as NSString).length)) != nil ? [] : [Form.Error(message: message)]
        } else {
            assertionFailure("Pattern error")
            return []
        }
    }
    
}
