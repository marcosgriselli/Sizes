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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let root = SizesViewController()
        let navigation = UINavigationController(rootViewController: ViewController())
        window.rootViewController = root
        root.contain(viewController: navigation)
        window.makeKeyAndVisible()
        return true
    }
}
