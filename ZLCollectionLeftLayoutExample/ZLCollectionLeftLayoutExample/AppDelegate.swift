//
//  AppDelegate.swift
//  ZLCollectionLeftAlignLayoutExample
//
//  Created by harllan on 2023/9/8.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let nav = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = nav
        return true
    }
}

