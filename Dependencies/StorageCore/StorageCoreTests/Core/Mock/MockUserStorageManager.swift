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
                onResponse: @escaping (Bool, Error?) -> Void) {
        
        self.validate(user.name) { (error) in
            guard error == nil else {
                onResponse(false, error)
                return
            }
            
            self.doesUserExist(userId: user.id) { (doesUserIdExists) in
                if doesUserIdExists {
                    onResponse(false, MockUserStorageError.idAlreadyExists)
                    return
                }
                
                user.toManagedObject(from: self.store.managedContext)
                self.store.saveManagedContext(onResponse: onResponse)
            }
            
        }
        
    }
    
    func fetchUsers(onResponse: @escaping ([CD_User]?, Error?) -> Void) {
        self.store.fetch(User.toManagedObjectType, onResponse: onResponse)
    }
    
    func updateUser(name: String, for userId: UUID,
                    onResponse: @escaping (Bool, Error?) -> Void) {
        self.validate(name) { (error) in
            guard error == nil else {
                onResponse(false, error)
                return
            }
            
            let predicate = NSPredicate(format: "id == %@", userId.uuidString)
            self.store.fetch(CD_User.self, filter: predicate) { (users, error) in
                guard let _users = users else {
                    onResponse(false, MockUserStorageError.idDoesNotExist)
                    return
                }
                
                _users.forEach {
                    $0.name = name
                }
                
                self.store.saveManagedContext(onResponse: onResponse)
            }
        }
    }
    
    func delete(user: User,
                onResponse: @escaping (Bool, Error?) -> Void) {
        self.validate(user.name) { (error) in
            guard error == nil else {
                onResponse(false, error)
                return
            }
            
            self.store.delete(user.toManagedObject(from: self.store.managedContext),
                              onResponse: onResponse)
        }
    }
    
}

extension MockUserStorageManager {
    
    func validate(_ userName: String,
                  onResponse: (_ error: Error?) -> Void) {
        
        guard !userName.isEmpty else {
            onResponse(MockUserStorageError.nameCanNotBeEmpty)
            return
        }
        
        guard userName.count > 2 else {
            onResponse(MockUserStorageError.invalidName)
            return
        }
        
        // Success
        onResponse(nil)
    }
    
    func doesUserExist(with name: String? = nil,
                       userId: UUID? = nil,
                       onResponse: @escaping (Bool) -> Void) {
        // must have atleast one value either name or userId
        if name == nil && userId == nil {
            onResponse(false)
            return
        }
        
        var predicate = NSPredicate()
        
        // Search for both
        if let safeName = name, let safeUserId = userId {
            predicate = NSPredicate(format: "id == %@ AND name like[c] %@", argumentArray: [safeUserId.uuidString, safeName])
        }
        
        // Name only
        if let safeName = name {
            predicate = NSPredicate(format: "name like[c] %@", safeName)
        }
        
        // userId only
        if let safeUserId = userId {
            predicate = NSPredicate(format: "%K == %@", "id", safeUserId as CVarArg)
        }
        
        self.store.fetch(CD_User.self, filter: predicate) { (users, error) in
            onResponse(!(users?.isEmpty ?? true))
        }
    }
    
}
