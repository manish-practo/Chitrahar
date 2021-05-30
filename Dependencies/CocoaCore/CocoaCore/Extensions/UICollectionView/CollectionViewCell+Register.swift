//
//  CollectionViewCell+Register.swift
//  CocoaCore
//
//  Created by Manish Pandey on 30/05/21.
//

import UIKit

public extension UICollectionView {

    func register<T: UICollectionViewCell> (_: T.Type) {

        self.register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }

}
