//
//  UpperCase.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

extension Filters {
    
    public static func UpperCase() -> Filter {
        return UpperCaseFilter()
    }
    
    class UpperCaseFilter: Filter {
        
        open func filtere(value: String) -> String {
            return value.uppercased()
        }
    }
    
}
