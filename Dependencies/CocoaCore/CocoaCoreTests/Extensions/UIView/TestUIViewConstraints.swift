//
//  TestUIViewConstraints.swift
//  CocoaCoreTests
//
//  Created by Manish Pandey on 30/05/21.
//

import UIKit
import XCTest
@testable import CocoaCore

class TestUIViewConstraints: XCTestCase {
    
    private var sut: UIView!
    private var testVC: UIViewController!
    
    private let sutId = "sutChildView"
    private let testVCViewId = "testVCView"
    
    override func setUp() {
        self.sut = UIView()
        self.testVC = UIViewController()
        
        self.sut.restorationIdentifier = self.sutId
        self.testVC.view.restorationIdentifier = self.testVCViewId
        
        self.testVC.loadViewIfNeeded()
    }
    
    override func tearDown() {
        self.sut = nil
        self.testVC = nil
    }
    
}

extension TestUIViewConstraints {
    
    func test_addViewToParentView_success() {
        self.sut.add(to: self.testVC.view)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.testVC.view))
        XCTAssertEqual(self.sut.superview?.restorationIdentifier, self.testVCViewId)
        XCTAssertFalse(self.sut.translatesAutoresizingMaskIntoConstraints)
    }
    
    func test_sameSazeAsTestVCRootView_success() {
        
        self.sut.allAnchorsSame(on: self.testVC.view)
        
        // Tests
        XCTAssertEqual(self.sut.frame.origin, self.testVC.view.frame.origin)
        
        XCTAssertEqual((self.testVC.view.constraints.first?.firstItem as? UIView)?.restorationIdentifier,
                       self.sutId)
        XCTAssertEqual((self.testVC.view.constraints.first?.secondItem as? UIView)?.restorationIdentifier,
                       self.testVCViewId)
    }
    
}
