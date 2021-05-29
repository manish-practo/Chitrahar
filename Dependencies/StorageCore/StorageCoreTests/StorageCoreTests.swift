//
//  StorageCoreTests.swift
//  StorageCoreTests
//
//  Created by Manish Pandey on 29/05/21.
//

import XCTest
@testable import StorageCore

class StorageCoreTests: XCTestCase {

    private var store: CoreDataStore!
    private var sut: MockUserStorageManager!
    private var defaultUser: User!
    
    private let expectationTimeout = TimeInterval(10)
    private let xcModelName = "TestStorageCoreModel"
    private let currentBundle = Bundle(for: StorageCoreTests.self)
    
    override func setUp() {
        let configExp = expectation(description: "storeConfigureSetupsExpectation")
        
        self.store = CoreDataStore(containerName: self.xcModelName, bundle: currentBundle)
        self.store.configureSetups {(error) in
            assert(error == nil, error.debugDescription)
            
            configExp.fulfill()
        }
        
        wait(for: [configExp], timeout: self.expectationTimeout)
        
        self.sut = MockUserStorageManager(store: self.store)
        self.defaultUser = User(id: UUID(), name: "ABC")
    }
    
    override func tearDown() {
        self.store = nil
        self.sut = nil
    }

}

// MARK: - Create
extension StorageCoreTests {
    
    func test_createUser_success() {
        var _status = false
        var _error: Error? = nil
        
        let exp = expectation(description: "createUserExpectation")
        
        sut.create(self.defaultUser) { (status, error) in
            _status = status
            _error = error
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: self.expectationTimeout)
        
        XCTAssertTrue(_status)
        XCTAssertNil(_error)
    }
    
}

extension StorageCoreTests {
    
    func test_fetchUsers_success() {
        
        var _users: [CD_User]?
        var _error: Error?
        
        let exp = expectation(description: "fetchUserExpectation")
        
        self.sut.fetch { (users, error) in
            _users = users
            _error = error
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: self.expectationTimeout)
        
        XCTAssertNotNil(_users)
        XCTAssertNil(_error)
        
    }
    
}
