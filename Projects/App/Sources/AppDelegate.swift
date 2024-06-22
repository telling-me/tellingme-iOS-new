//
//  AppDelegate.swift
//  TellingMe-iOS
//
//  Created by Woody Lee on 6/4/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

import AppCore_DesignSystem
import LoginScene

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
        // MARK: - RootScene이 개발되기 전까지 진입점 수정해가면서 테스트
        let viewController = LoginSceneBuilder().make(with: .init()).viewController
       
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController

        // Present Window
        window.makeKeyAndVisible()

        return true
    }
}
