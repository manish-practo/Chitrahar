//
//  MockUserStorageManager.swift
//  StorageCoreTests
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation
@testable import StorageCore

class MockUserStorageManager: ObjectStorageProvider<User> {
    
    override func create(_ object: User,
                         onResponse: (Bool, Error?) -> Void) {
        object.toManagedObject(from: self.store.managedContext)
        self.store.saveManagedContext(onResponse: onResponse)
    }
    
    func fetch(onResponse: @escaping ([CD_User]?, Error?) -> Void) {
        self.store.fetch(User.toManagedObjectType,
                         onResponse: onResponse)
    }
    
}
