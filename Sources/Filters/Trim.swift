//
//  Trim.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation


extension Filters {
    
    public static func Trim() -> Filter {
        return TrimFilter()
    }
    
    class TrimFilter: Filter {
        
        open func filtere(value: String) -> String {
            return value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
        
    }
    
}
