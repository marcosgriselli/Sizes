//
//  SizesWindow.swift
//  Pods-Sizes_Example
//
//  Created by Bahadir Oncel on 14.10.2018.
//

import UIKit

open class SizesWindow: UIWindow {
    
    private(set) open var containedRootViewController: UIViewController?
    private(set) open var sizesViewController: SizesViewController?
    
    override open var rootViewController: UIViewController? {
        get {
            return containedRootViewController
        }
        set {
            if let rootVC = newValue, !rootVC.isKind(of: SizesViewController.self) {
                let root = SizesViewController()
                sizesViewController = root
                self.rootViewController = root
                containedRootViewController = rootVC
                root.contain(viewController: rootVC)
            }
        }
    }
}
