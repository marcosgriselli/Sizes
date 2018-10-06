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
        let tabBarController = UITabBarController()
        let navigation = UINavigationController(rootViewController: ViewController())
        if #available(iOS 11.0, *) {
            navigation.navigationBar.prefersLargeTitles = true
        }
        navigation.tabBarItem = UITabBarItem(title: "Sizes", image: UIImage(named: "shapes"), tag: 0)
        let readme = ReadmeViewController()
        readme.tabBarItem = UITabBarItem(title: "Readme", image: UIImage(named: "github"), tag: 1)
        tabBarController.setViewControllers([navigation, readme], animated: false)
        
        window.rootViewController = root
        root.contain(viewController: tabBarController)
//        root.set(devices: Device.valuesForIdiom(.pad))
        window.makeKeyAndVisible()
        
        return true
    }
}
