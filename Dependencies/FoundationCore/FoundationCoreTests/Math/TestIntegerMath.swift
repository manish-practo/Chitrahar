//
//  TestIntegerMath.swift
//  FoundationCoreTests
//
//  Created by Manish Pandey on 30/05/21.
//

import Foundation
import XCTest
@testable import FoundationCore

class TestIntegerMath: XCTestCase {
    
    private var sut: Int!
    
    override func setUp() {
        self.sut = Int()
    }
    
    override func tearDown() {
        self.sut = nil
    }
    
}

extension TestIntegerMath {
    
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

extension TestIntegerMath {
    
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
