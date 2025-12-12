//
//  HomeViewTest.swift
//  infinion-assessmentTests
//
//  Created by USER on 12/12/2025.
//

import XCTest
@testable import infinion_assessment

final class HomeViewTest: XCTestCase {

    var cityTextField: UITextField!
    
    override func setUpWithError() throws {
        cityTextField = UITextField()
        cityTextField.text = "Lagos"
    }

    override func tearDownWithError() throws {
        cityTextField = nil
    }

    func testExample() throws { }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testThatTextFieldIsNotEmpty() {
        XCTAssertTrue(!(cityTextField.text?.isEmpty ?? true))
    }
}
