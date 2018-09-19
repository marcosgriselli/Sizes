//
//  AppDelegate.swift
//  Sizes
//
//  Created by git on 09/19/2018.
//  Copyright (c) 2018 git. All rights reserved.
//

import UIKit
import Sizes

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let root = SizesViewController()
        let tabBarController = UITabBarController()
        let navigation = UINavigationController(rootViewController: ViewController())
        if #available(iOS 11.0, *) {
            navigation.navigationBar.prefersLargeTitles = true
        }
        tabBarController.setViewControllers([navigation], animated: false)
        
        window.rootViewController = root
        root.contain(viewController: tabBarController)
        window.makeKeyAndVisible()
        
        return true
    }
}
