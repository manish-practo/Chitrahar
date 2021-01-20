//
//  AppDelegate.swift
//  MovieHub
//
//  Created by Manish Pandey on 20/01/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setupRootViewController()
        
        return true
    }

    
}

extension AppDelegate {
    
    private func setupRootViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MainViewController()
        self.window?.makeKeyAndVisible()
    }
    
}
