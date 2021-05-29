//
//  CoreDataConfigProvider.swift
//  StorageCore
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation
import CoreData

public protocol CoreDataConfigProvider {
    
    var managedContext: NSManagedObjectContext! { get }
    var persistentContainer: NSPersistentContainer! { get }
        
    func loadPersistentStores(with persistentContainerName: String,
                              onResponse: @escaping (NSPersistentStoreDescription, Error?) -> Void)
    func saveManagedContext(onResponse: (Bool, Error?) -> Void)
    
}
