//
//  Trim.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

class TrimFilter: Filter {
    
    public func filtere(value: String) -> String {
        return value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
}
