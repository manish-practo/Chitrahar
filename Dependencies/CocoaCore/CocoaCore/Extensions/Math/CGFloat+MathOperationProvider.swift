//
//  CGFloat+MathOperationProvider.swift
//  CocoaCore
//
//  Created by Manish Pandey on 31/05/21.
//

import UIKit
import FoundationCore

extension CGFloat: MathOperationProvider {
    
    public var half: CGFloat { self / 2 }
    
    public var double: CGFloat { self * 2 }
    
}
