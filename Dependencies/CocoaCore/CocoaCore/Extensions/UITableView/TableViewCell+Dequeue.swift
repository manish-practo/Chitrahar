//
//  TableViewCell+Dequeue.swift
//  CocoaCore
//
//  Created by Manish Pandey on 30/05/21.
//

import UIKit

public extension UITableView {

    func dequeue<T: UITableViewCell> (_: T.Type,
                                      for indexPath: IndexPath) -> T? {

        guard let cell = dequeueCell(reuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            assertionFailure("Could not deque cell with type \(T.self)")
            return nil
        }

        return cell
    }

    func dequeueCell (reuseIdentifier identifier: String,
                      for indexPath: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }

}
