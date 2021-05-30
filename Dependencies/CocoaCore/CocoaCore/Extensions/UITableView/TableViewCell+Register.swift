//
//  TableViewCell+Register.swift
//  CocoaCore
//
//  Created by Manish Pandey on 30/05/21.
//

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell> (_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
}
