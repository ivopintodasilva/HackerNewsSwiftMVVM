//
//  AppDelegate.swift
//  HackerNewsMVVM
//
//  Created by Ivo Silva on 10/01/2017.
//  Copyright © 2017 Ivo Silva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let initialViewModel: NewsViewModel = NewsViewModel()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }


}

