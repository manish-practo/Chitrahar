//
//  TestUICollectionViewCellRegistration.swift
//  CocoaCoreTests
//
//  Created by Manish Pandey on 30/05/21.
//

import UIKit
import XCTest
@testable import CocoaCore

class TestUICollectionViewCellRegistration: XCTestCase {
    
    private var sut: UICollectionView!
    
    override func setUp() {
        self.sut = UICollectionView(frame: .zero, collectionViewLayout: .init())
    }
    
    override func tearDown() {
        self.sut = nil
    }
    
}

extension TestUICollectionViewCellRegistration {
    
    func test_registerCell_success() {
        
        let cellType = UICollectionViewCell.self
        
        // Register
        self.sut.register(cellType)
        
        // Test
        let dequeuedCell = self.sut.dequeue(cellType, for: IndexPath(row: 0, section: 0))
        
        XCTAssertNotNil(dequeuedCell)
        XCTAssertTrue(cellType == type(of: dequeuedCell))
    }
    
    func test_dequeu_notRegisteredCell_failure() {
        // TODO: Handle fatal
    }
    
}
