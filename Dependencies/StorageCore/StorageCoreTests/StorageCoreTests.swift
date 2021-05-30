//
//  StorageCoreTests.swift
//  StorageCoreTests
//
//  Created by Manish Pandey on 29/05/21.
//

import XCTest
@testable import StorageCore

class StorageCoreTests: XCTestCase {

    private var store: MockCoreDataStore!
    private var sut: MockUserStorageManager!
    private var defaultUser: User!
    
    private let expectationTimeout = TimeInterval(10)
    private let xcModelName = "TestStorageCoreModel"
    private let currentBundle = Bundle(for: StorageCoreTests.self)
    
    override func setUp() {
        let configExp = expectation(description: "storeConfigureSetupsExpectation")
        
        self.store = MockCoreDataStore(containerName: self.xcModelName, bundle: currentBundle, isInMemoryStore: true)
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
        self.defaultUser = nil
    }

}

// MARK: - Create
extension StorageCoreTests {
    
    func test_createUser_success() {
        var _status = false
        var _error: Error? = nil
        
        let exp = expectation(description: "createUserExpectation")
        
        self.sut.create(self.defaultUser) { (status, error) in
            _status = status
            _error = error
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: self.expectationTimeout)
        
        XCTAssertTrue(_status)
        XCTAssertNil(_error)
    }
    
    func test_createUser_withoutName_failiure() {
        var _status = false
        var _error: Error? = nil
        
        let exp = expectation(description: "createUserFailedExpectation")
        
        self.sut.create(User(id: UUID(), name: "")) { (status, error) in
            _status = status
            _error = error
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: self.expectationTimeout)
        
        XCTAssertFalse(_status)
        XCTAssertNotNil(_error)
        XCTAssertEqual(_error as? MockUserStorageError, MockUserStorageError.nameCanNotBeEmpty)
    }
    
}

extension StorageCoreTests {
    
    func test_fetchUsers_success() {
        
        var _users: [CD_User]?
        var _error: Error?
        
        let exp = expectation(description: "fetchUserExpectation")
        
        self.sut.fetchUsers { (users, error) in
            _users = users
            _error = error
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: self.expectationTimeout)
        
        XCTAssertNotNil(_users)
        XCTAssertNil(_error)
        
    }
    
}
