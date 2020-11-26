//
//  AppDelegate.swift
//  LoopNewMedia
//
//  Created by Benyamin Mokhtarpour on 9/19/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.


import UIKit
import BubbleTabBar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        
        let navController = UINavigationController(rootViewController: MainViewController())
        navController.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(named: "discover"), tag: 0)
        navController.tabBarItem.selectedImage = UIImage(named: "discover")

        let searchVC = CBSampleViewController()
        searchVC.tabBarItem = UITabBarItem(title: "Iranian Girls", image: #imageLiteral(resourceName: "girl"), tag: 0)
        searchVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "girl")

        let settingsVC = CBSampleViewController()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: #imageLiteral(resourceName: "clock"), tag: 0)
        settingsVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "clock")
        settingsVC.inverseColor()

        let tabBarController = BubbleTabBarController()
        tabBarController.viewControllers = [navController, searchVC, settingsVC]
        tabBarController.tabBar.tintColor = #colorLiteral(red: 0.1579992771, green: 0.1818160117, blue: 0.5072338581, alpha: 1)
        
        window?.rootViewController = tabBarController

        return true
    }

}

