//
//  CoreDataStore.swift
//  StorageCore
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation
import CoreData

open class CoreDataStore: CoreDataConfigProvider & CoreDataOperationProvider {
    
    private(set) public var managedContext: NSManagedObjectContext!
    private(set) public var persistentContainer: NSPersistentContainer!
    let containerName: String
    
    public init(containerName: String) {
        self.containerName = containerName
    }
    
    open func configureSetups(onResponse: @escaping (Error?) -> Void) {
        self.loadPersistentStores(with: containerName) { (storeDescription, error) in
            self.managedContext = self.persistentContainer.viewContext
            
            onResponse(error)
        }
    }
    
    public func loadPersistentStores(with persistentContainerName: String,
                                     onResponse: @escaping (NSPersistentStoreDescription, Error?) -> Void) {
        let container = NSPersistentContainer(name: persistentContainerName)
        container.loadPersistentStores { (storeDescription, error) in
            
            if error == nil {
                self.persistentContainer = container
            }
            
        }
    }
    
    public func saveManagedContext(onResponse: (Bool, Error?) -> Void) {
        
    }
    
    public func fetch<MANAGED_OBJECT: NSManagedObject>(_ managedObjectType: MANAGED_OBJECT.Type,
                                                       filter predicate: NSPredicate? = nil,
                                                       onResponse: (_ object: [MANAGED_OBJECT]?, _ error: Error?) -> Void) {
        
        let objectEntityName: String = String(describing: managedObjectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: objectEntityName)
        fetchRequest.predicate = predicate
        
        do {
            let result = try managedContext.fetch(fetchRequest) as? [MANAGED_OBJECT]
            onResponse(result, nil)
        } catch {
            onResponse(nil, error)
        }
        
    }
    
    public func delete(_ managedObject: NSManagedObject,
                onResponse: (Bool, Error?) -> Void) {
        self.managedContext.delete(managedObject)
        self.saveManagedContext(onResponse: onResponse)
    }
    
}
