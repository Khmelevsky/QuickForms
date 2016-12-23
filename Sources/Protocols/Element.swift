//
//  Element.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 20.12.16.
//  Copyright © 2016 Alexander Khmelevsky. All rights reserved.
//

import Foundation

public protocol Element: class {
    var errors: [ErrorProtocol] { get }
    var source: ElementDataSource { get }
}

public protocol ElementDataSource {
    var formValue: CustomStringConvertible { get }
}
