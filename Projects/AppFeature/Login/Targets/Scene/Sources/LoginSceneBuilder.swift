//
//  LoginSceneBuilder.swift
//
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
public protocol LoginScene: AnyObject, Scene {
    
}

public struct LoginConfiguration {
    
    public init() {}
    
}

public final class LoginSceneBuilder {
    
    public init() {}
    
    public func make(with configuration: LoginConfiguration) -> LoginScene {
        let viewController = LoginViewController()
        let worker = LoginWorker()
        let presenter = LoginPresenter(
            viewController: viewController
        )
        let interactor = LoginInteractor(
            presenter: presenter,
            worker: worker
        )
        let router = LoginRouter(
            viewController: viewController,
            dataStore: interactor
        )
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
