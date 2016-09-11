//
//  AppDelegate.swift
//  suh
//
//  Created by Dulio Denis on 9/10/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        guard let window = window else { return false }
        window.backgroundColor = UIColor(red: 189/255, green: 95/255, blue: 199/255, alpha: 1.0)
        
        window.rootViewController = UINavigationController(rootViewController: PhotoListController())
        window.makeKeyAndVisible()
        
        return true
    }

}

