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
    
    func fetchUsers(onResponse: @escaping ([CD_User]?, Error?) -> Void) {
        self.store.fetch(User.toManagedObjectType) { users, error in
            onResponse(users, error)
        }
    }
    
    func updateUser(name: String, for userId: UUID,
                    onResponse: @escaping (Bool, Error?) -> Void) {
        let predicate = NSPredicate(format: "id == %@", userId.uuidString)
        self.store.fetch(CD_User.self, filter: predicate) { (users, error) in
            guard let _users = users, error == nil else {
                onResponse(false, error)
                return
            }
            
            _users.forEach {
                $0.name = name
            }
            
            self.store.saveManagedContext(onResponse: onResponse)
        }
    }
    
    func delete(user: User,
                onResponse: @escaping (Bool, Error?) -> Void) {
        self.store.delete(user.toManagedObject(from: self.store.managedContext),
                          onResponse: onResponse)
    }
    
}
