//
//  CD_User+CoreDataProperties.swift
//  StorageCoreTests
//
//  Created by Manish Pandey on 29/05/21.
//
//

import Foundation
import CoreData


extension CD_User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CD_User> {
        return NSFetchRequest<CD_User>(entityName: "CD_User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}

extension CD_User : Identifiable {

}
