//
//  TestUITableViewCellRegistration.swift
//  CocoaCoreTests
//
//  Created by Manish Pandey on 30/05/21.
//

import Foundation
import UIKit
import XCTest
@testable import CocoaCore

class TestUITableViewCellRegistration: XCTestCase {
    
    private var sut: UITableView!
    
    override func setUp() {
        self.sut = UITableView()
    }
    
    override func tearDown() {
        self.sut = nil
    }
    
}

extension TestUITableViewCellRegistration {
    
    func test_cellRegistration_success() {
        
        let cellType = UITableViewCell.self
        
        // Register cell
        self.sut.register(cellType)
        
        // Dequeue
        let registeredCell = self.sut.dequeue(cellType, for: IndexPath(row: 0, section: 0))
        
        // Test
        XCTAssertNotNil(registeredCell)
        XCTAssertTrue(type(of: registeredCell!) == cellType)
        
    }
    
    func test_dequeu_notRegisteredCell_failure() {
        // TODO: Handle fatal
    }
    
}
