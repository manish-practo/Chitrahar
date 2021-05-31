//
//  Int+MathOperationProvider.swift
//  FoundationCore
//
//  Created by Manish Pandey on 30/05/21.
//

import Foundation

extension Int: MathOperationProvider {
    
    public var half: Int { self / 2 }
    
    public var double: Int { self * 2 }
    
}
