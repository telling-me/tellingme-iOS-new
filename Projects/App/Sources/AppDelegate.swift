//
//  AppDelegate.swift
//  TellingMe-iOS
//
//  Created by Woody Lee on 6/4/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

import RootScene

final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        // Configure window
        let window = UIWindow()
        self.window = window

        // Set root

        // Present Window
        window.makeKeyAndVisible()

        return true
    }
}
