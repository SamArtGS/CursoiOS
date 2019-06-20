//
//  AppDelegate.swift
//  ElMasho
//
//  Created by Samuel Arturo Garrido Sánchez on 6/19/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        window?.rootViewController = UINavigationController(rootViewController: CompaniesController())
        
        return true
    }


}

