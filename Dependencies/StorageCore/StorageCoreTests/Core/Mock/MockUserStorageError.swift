//
//  MockUserStorageError.swift
//  StorageCoreTests
//
//  Created by Manish Pandey on 29/05/21.
//

import Foundation

enum MockUserStorageError: Int, Error {
    case nameCanNotBeEmpty
    case invalidName
    case nameAlreadyExists
    case idAlreadyExists
    case idDoesNotExist
    case invalidId
}

extension MockUserStorageError: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool { lhs.rawValue == rhs.rawValue }
    
}
