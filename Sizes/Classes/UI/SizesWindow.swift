//
//  SizesWindow.swift
//  Pods-Sizes_Example
//
//  Created by Bahadir Oncel on 14.10.2018.
//

import UIKit

open class SizesWindow: UIWindow {
    
    public let sizesViewController = SizesViewController()
    
    override open var rootViewController: UIViewController? {
        get {
            return sizesViewController.containedController
        }
        set {
            guard let root = newValue, !root.isKind(of: SizesViewController.self) else {
                return
            }
            super.rootViewController = sizesViewController
            sizesViewController.contain(viewController: root)
        }
    }
}
