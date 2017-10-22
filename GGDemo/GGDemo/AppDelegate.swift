//
//  AppDelegate.swift
//  GGDemo
//
//  Created by Glenn Posadas on 10/21/17.
//  Copyright © 2017 Glenn Posadas. All rights reserved.
//

import Firebase
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

