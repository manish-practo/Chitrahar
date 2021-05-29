//
//  Storable.swift
//  StorageCore
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation
import CoreData

public protocol Storable {
    
    func toManagedObject(from managedContext: NSManagedObjectContext) -> NSManagedObject
    
}
