//
//  CoreDataOperationProvider.swift
//  StorageCore
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation
import CoreData

public protocol CoreDataOperationProvider {
    
    func fetch<MANAGED_OBJECT: NSManagedObject>(_ managedObjectType: MANAGED_OBJECT.Type,
                                                filter predicate: NSPredicate?,
                                                onResponse: @escaping (_ object: [MANAGED_OBJECT]?, _ error: Error?) -> Void)
    
    func delete(_ managedObject: NSManagedObject,
                onResponse: @escaping (Bool, Error?) -> Void)
    
}
