//
//  ObjectStorageProvider.swift
//  StorageCore
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation

public class ObjectStorageProvider<Object: Storable> {
    
    private(set) public var store: CoreDataStore
    
    init(store: CoreDataStore) {
        self.store = store
    }
    
    func create(_ object: Object,
                onResponse: (Bool, Error?) -> Void) { }
    func fetch(_ objectType: Object.Type) { }
    func update(_ object: Object) { }
    func delete(_ object: Object) { }
    
}
