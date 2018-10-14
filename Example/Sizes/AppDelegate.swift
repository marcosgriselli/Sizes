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
        
        /// Instanciate SizesViewController
        let root = SizesViewController()
        
        let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        
        /// I highly recommend Sizes is used only on DEBUG mode.
        #if DEBUG
            root.contain(viewController: tabBarController)
        #endif
        
        /// Automatically present the Sizes configuration sheet if we're running UITests.
        if CommandLine.arguments.contains("-uitest") {
            root.presentConfiguration()
        }
        
        window.rootViewController = root
        window.makeKeyAndVisible()
        return true
    }
}
