//
//  User.swift
//  StorageCoreTests
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation
import CoreData
@testable import StorageCore

struct User: Storable {
    let id: UUID
    let name: String
}

extension User {
    
    func toManagedObject(from managedContext: NSManagedObjectContext) -> NSManagedObject {
        let cdUser = CD_User(context: managedContext)
        cdUser.id = self.id
        cdUser.name = self.name
        
        return cdUser
    }
    
}
