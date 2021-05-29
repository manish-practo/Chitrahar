//
//  MockUserStorageError.swift
//  StorageCoreTests
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation

enum MockUserStorageError: Error {
    case nameCanNotBeEmpty
    case invalidName
    case idAlreadyExists
    case idDoesNotExist
    case invalidId
}
