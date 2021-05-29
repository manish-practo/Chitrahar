//
//  CoreDataConfigProvider.swift
//  StorageCore
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation
import CoreData

public protocol CoreDataConfigProvider {
    var containerName: String { get }
    var managedContext: NSManagedObjectContext! { get }
    var persistentContainer: NSPersistentContainer! { get }
    var isConfigured: Bool { get }
    
    func configureSetups(onResponse: @escaping (Error?) -> Void)
    func loadPersistentStores(with persistentContainerName: String,
                              onResponse: @escaping (NSPersistentStoreDescription?, Error?) -> Void)
    func saveManagedContext(onResponse: (Bool, Error?) -> Void)
    
}
