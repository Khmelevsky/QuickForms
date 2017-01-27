//
//  Filter.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

final public class Filters {}

open class Filter<T> {
    open func filter(value:T?) -> T? {
        return value
    }
}

