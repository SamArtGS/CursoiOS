//
//  AppDelegate.swift
//  iOSInter
//
//  Created by Samuel Arturo Garrido Sánchez on 6/20/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }

}

