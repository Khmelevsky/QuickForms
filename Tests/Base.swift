//
//  Base.swift
//  QuickForms
//
//  Created by Alexander Khmelevsky on 15.02.17.
//  Copyright © 2017 Alexander Khmelevsky. All rights reserved.
//

import XCTest
import QuickForms

private let TEST_EMAIL = "user-email@gmail.com"


class Base: XCTestCase {
    
    let form = TestForm()
    
    override func setUp() {
        super.setUp()
        
        form.field1.bind(to: form.tfText)
        
        form.field2.bind(to: form.tfEmail)
        form.tfEmail.text = TEST_EMAIL
        
        form.field3.bind(to: form.tfInt)
        form.tfInt.text = " 5 "
    }
    
    func testEmptyForm() {
        let form = EmptyForm()
        XCTAssertTrue(form.isValid())
    }
    
    func testValidation() {
        XCTAssert(form.isValid(), "validation don't work")
    }
    
    func testValues() {
        print("asdasdaasd:\(form.field1.value(default: "test"))")
        XCTAssertEqual(form.field1.value(), "")
        XCTAssertEqual(form.field1.value(default: "test"), "test")
        XCTAssertEqual(form.field2.value(), TEST_EMAIL)
        XCTAssertEqual(form.field3.value(), 5000)
    }
    
    func testError() {
        let form = ErrorForm()
        form.field.bind(to: form.tfError)
        XCTAssertFalse(form.isValid()) // check is valid
        XCTAssertEqual(form.errors.count, 1) // check count error
    }
    
}

// MARK: - Forms
extension Base {
    
    class EmptyForm: Form {}
    
    class TestForm: Form {
        // sources
        let tfText = UITextField()
        let tfEmail = UITextField()
        let tfInt = UITextField()
        
        // fields
        let field1 = Field<String>()
        let field2 = Field<String>()
            .add(validator: Validators.Required())
            .add(validator: Validators.Email())
        let field3 = Field<Int>()
            .add(filter: Filters.Custom({ $0 != nil ? $0! * 1000 : $0 }))
                
        override func elements() -> [Element] {
            return [field1, field2] + super.elements()
        }
    }
    
    class ErrorForm: Form {
        let tfError = UITextField()
        let field = Field<String>().add(validator: Validators.Required())
        
        override func elements() -> [Element] {
            return [field] + super.elements()
        }
    }
    
    
}
