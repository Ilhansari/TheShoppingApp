//
//  AppConfig.swift
//  TheShoppingApp
//
//  Created by Ilhan Sari on 11.01.2022.
//

import Foundation

final class AppConfig {

    static var environment: Environment!
    static var isDebug: Bool = false

    static func configure() {
        #if DEBUG
        isDebug = true
        #endif

        loadFromConfigFile()
    }

    private static func loadFromConfigFile() {

        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
              let config = NSDictionary(contentsOfFile: path) as? [String: Any] else {
                  fatalError("No found plist file!")
              }

        guard let baseUrl = config["BaseUrl"] as? String else { return }

        environment = Environment(baseUrl: baseUrl)
    }
}
