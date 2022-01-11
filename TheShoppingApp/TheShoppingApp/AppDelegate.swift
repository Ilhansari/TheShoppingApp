//
//  AppDelegate.swift
//  TheShoppingApp
//
//  Created by Ilhan Sari on 11.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppConfig.configure()

        return true
    }
}
