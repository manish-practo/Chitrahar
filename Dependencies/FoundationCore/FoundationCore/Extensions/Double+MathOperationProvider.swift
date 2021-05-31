//
//  Double+MathOperationProvider.swift
//  FoundationCore
//
//  Created by Manish Pandey on 31/05/21.
//

import Foundation

extension Double: MathOperationProvider {
    
    public var half: Double { self / 2 }
    
    public var double: Double { self * 2 }
    
}
