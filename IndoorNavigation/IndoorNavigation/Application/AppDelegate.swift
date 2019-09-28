//
//  AppDelegate.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 28.09.2019.
//Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainModuleConfigurator().configure()
        window?.makeKeyAndVisible()

        return true
    }
}
