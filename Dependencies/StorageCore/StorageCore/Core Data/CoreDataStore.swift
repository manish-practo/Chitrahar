//
//  CoreDataStore.swift
//  StorageCore
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation
import CoreData

open class CoreDataStore: CoreDataConfigProvider {
    
    private(set) public var managedContext: NSManagedObjectContext!
    private(set) public var persistentContainer: NSPersistentContainer!
    private(set) public var containerName: String
    private(set) public var bundle: Bundle
    private(set) public var isConfigured: Bool = false
    private(set) public var isInMemoryStore = false
    
    public init(containerName: String,
                bundle: Bundle,
                isInMemoryStore: Bool = false) {
        self.containerName = containerName
        self.bundle = bundle
        self.isInMemoryStore = isInMemoryStore
    }
    
    open func configureSetups(onResponse: @escaping (Error?) -> Void) {
        self.loadPersistentStores(with: containerName) { (storeDescription, error) in
            if error == nil {
                self.managedContext = self.persistentContainer.viewContext
                self.isConfigured = (error == nil)
            }
            
            onResponse(error)
        }
    }
    
    public func loadPersistentStores(with persistentContainerName: String,
                                     onResponse: @escaping (NSPersistentStoreDescription?, Error?) -> Void) {
        guard let dataModelURL = self.bundle.url(forResource: self.containerName, withExtension: "momd"),
              let managedObjectModel =  NSManagedObjectModel(contentsOf: dataModelURL) else {
            onResponse(nil, CoreDataStoreError.couldNotLoadDataModel)
            return
        }
        
        let container = NSPersistentContainer(name: persistentContainerName, managedObjectModel: managedObjectModel)
        
        if self.isInMemoryStore {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            
            container.persistentStoreDescriptions = [description]
        }
        
        container.loadPersistentStores { (storeDescription, error) in
            self.persistentContainer = container
            
            onResponse(storeDescription, error)
        }
    }
    
    public func saveManagedContext(onResponse: (Bool, Error?) -> Void) {
        if self.managedContext.hasChanges {
            do {
                try self.managedContext.save()
                onResponse(true, nil)
            } catch {
                onResponse(false, error)
            }
        }
    }
    
}

extension CoreDataStore: CoreDataOperationProvider {
    
    public func fetch<MANAGED_OBJECT: NSManagedObject>(_ managedObjectType: MANAGED_OBJECT.Type,
                                                       filter predicate: NSPredicate? = nil,
                                                       onResponse: @escaping (_ object: [MANAGED_OBJECT]?, _ error: Error?) -> Void) {
        if !self.isConfigured {
            onResponse(nil, CoreDataStoreError.notYetConfigured)
            return
        }
        
        self.managedContext.perform { [weak self] in
            let objectEntityName: String = String(describing: managedObjectType)
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: objectEntityName)
            fetchRequest.predicate = predicate
            
            do {
                let result = try self?.managedContext.fetch(fetchRequest) as? [MANAGED_OBJECT]
                onResponse(result, nil)
            } catch {
                onResponse(nil, error)
            }
        }
        
    }
    
    public func delete(_ managedObject: NSManagedObject,
                       onResponse: @escaping (Bool, Error?) -> Void) {
        if !self.isConfigured {
            onResponse(false, CoreDataStoreError.notYetConfigured)
            return
        }
        
        self.managedContext.perform { [weak self] in
            self?.managedContext.delete(managedObject)
            self?.saveManagedContext(onResponse: onResponse)
        }
        
    }
    
}
