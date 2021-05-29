//
//  AppDelegate.swift
//  MovieHub
//
//  Created by Manish Pandey on 29/05/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setupRootViewController()
        return true
    }
    
}

private extension AppDelegate {
    
    func setupRootViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: StartViewController())
        self.window?.makeKeyAndVisible()
    }
    
}
