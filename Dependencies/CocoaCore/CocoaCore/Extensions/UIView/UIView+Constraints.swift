//
//  UIView+Constraints.swift
//  CocoaCore
//
//  Created by Manish Pandey on 30/05/21.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func add(to parentView: UIView) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false

        if !self.isDescendant(of: parentView) {
            parentView.addSubview(self)
        }

        return self
    }
    
    func allAnchorsSame(on parentView: UIView, with margin: CGFloat = 0) {
        self.add(to: parentView)
            .leading(of: parentView.leadingAnchor, margin: margin)
            .trailing(of: parentView.trailingAnchor, margin: margin)
            .top(of: parentView.topAnchor, margin: margin)
            .bottom(of: parentView.bottomAnchor, margin: margin)
    }
    
    func allAnchorsSame(on parentView: UIView,
                        margin: UIEdgeInsets) {
        self.add(to: parentView)
            .leading(of: parentView.leadingAnchor, margin: margin.left)
            .trailing(of: parentView.trailingAnchor, margin: margin.right)
            .top(of: parentView.topAnchor, margin: margin.top)
            .bottom(of: parentView.bottomAnchor, margin: margin.bottom)
    }
    
    @discardableResult
    func leading(of xAsixAnchor: NSLayoutXAxisAnchor, margin: CGFloat = 0) -> Self {
        self.leadingAnchor.constraint(equalTo: xAsixAnchor, constant: margin).isActive = true
        return self
    }
    
    @discardableResult
    func trailing(of xAsixAnchor: NSLayoutXAxisAnchor, margin: CGFloat = 0) -> Self {
        self.trailingAnchor.constraint(equalTo: xAsixAnchor, constant: -margin).isActive = true
        return self
    }
    
    @discardableResult
    func top(of yAsixAnchor: NSLayoutYAxisAnchor, margin: CGFloat = 0) -> Self {
        self.topAnchor.constraint(equalTo: yAsixAnchor, constant: margin).isActive = true
        return self
    }
    
    @discardableResult
    func bottom(of yAsixAnchor: NSLayoutYAxisAnchor, margin: CGFloat = 0) -> Self {
        self.bottomAnchor.constraint(equalTo: yAsixAnchor, constant: -margin).isActive = true
        return self
    }
    
    @discardableResult
    func centerX(of xAxis: NSLayoutXAxisAnchor) -> Self {
        self.centerXAnchor.constraint(equalTo: xAxis).isActive = true
        return self
    }
    
    @discardableResult
    func centerY(of yAxis: NSLayoutYAxisAnchor, margin: CGFloat = 0) -> Self {
        self.centerYAnchor.constraint(equalTo: yAxis, constant: -margin).isActive = true
        return self
    }
    
    @discardableResult
    func with(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        if let safeWidth = width {
            self.widthAnchor.constraint(equalToConstant: safeWidth).isActive = true
        }
        
        if let safeHeight = height {
            self.heightAnchor.constraint(equalToConstant: safeHeight).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func with(widthAndHeight: CGFloat) -> Self {
        self.with(width: widthAndHeight, height: widthAndHeight)
        
        return self
    }
    
}
