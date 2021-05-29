//
//  MockUserStorageManager.swift
//  StorageCoreTests
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation
@testable import StorageCore

class MockUserStorageManager: ObjectStorageManager {
    
    func create(_ user: User,
                onResponse: (Bool, Error?) -> Void) {
        user.toManagedObject(from: self.store.managedContext)
        self.store.saveManagedContext(onResponse: onResponse)
    }
    
    func fetch(onResponse: @escaping ([CD_User]?, Error?) -> Void) {
        self.store.fetch(User.toManagedObjectType) { users, error in
            onResponse(users, error)
        }
    }
    
}
