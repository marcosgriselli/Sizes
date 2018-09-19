//
//  AutoLayoutHelper.swift
//  DynamicAppResizer
//
//  Created by Marcos Griselli on 31/08/2018.
//

import UIKit

internal extension UIView {
    
    @discardableResult
    func centerInSuperview() -> [NSLayoutConstraint] {
        guard let superview = superview else {
            fatalError("Attempting to add constraints to a view that hasn't been added to the view hierarchy.")
        }
        let constraints = [
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    @discardableResult
    func constraintTo(size: CGSize) -> [NSLayoutConstraint] {
        let constraints = [
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height)
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
}
