//
//  TestCGFloatMathOperationProvider.swift
//  CocoaCoreTests
//
//  Created by Manish Pandey on 01/06/21.
//

import Foundation
import XCTest
@testable import FoundationCore

class TestCGFloatMathOperationProvider: XCTestCase {
    
    private var sut: CGFloat!
    
    override func setUp() {
        self.sut = CGFloat()
    }
    
    override func tearDown() {
        self.sut = nil
    }
    
}

extension TestCGFloatMathOperationProvider {
    
    func test_mathHalfOperation_success() {
        self.sut = 2
        
        let half = self.sut.half
        
        XCTAssertEqual(half, 1)
    }
    
    func test_mathHalfOperation_failure() {
        self.sut = 0
        
        let half = self.sut.half
        
        XCTAssertEqual(half, 0)
    }
    
}

extension TestCGFloatMathOperationProvider {
    
    func test_mathDoubleOperation_success() {
        self.sut = 4
        
        let double = self.sut.double
        
        XCTAssertEqual(double, 8)
    }
    
    func test_mathDoubleOperation_failure() {
        self.sut = 0
        
        let double = self.sut.double
        
        XCTAssertEqual(double, 0)
    }
    
}
