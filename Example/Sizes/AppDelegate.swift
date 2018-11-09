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
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /// I highly recommend Sizes is used only on DEBUG mode.
        #if DEBUG
            window = SizesWindow()
            window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
            window?.makeKeyAndVisible()
//            /// Automatically present the Sizes configuration sheet if we're running UITests.
            if CommandLine.arguments.contains("-uitest") {
                (window as! SizesWindow).presentConfiguration()
            }
        #endif
        
        return true
    }
}
