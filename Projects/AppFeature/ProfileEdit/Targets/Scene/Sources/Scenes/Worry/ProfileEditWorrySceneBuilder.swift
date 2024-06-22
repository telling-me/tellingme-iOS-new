//
//  ProfileEditWorrySceneBuilder.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
public protocol ProfileEditWorryScene: AnyObject, Scene {
    
}

public struct ProfileEditWorryConfiguration {
    
    public init() {}
    
}

public final class ProfileEditWorryScenBuilder {
    
    public init() {}
    
    public func make(with configuration: ProfileEditWorryConfiguration) -> ProfileEditWorryScene {
        let viewController = ProfileEditWorryViewController()
        let worker = ProfileEditWorryWorker()
        let presenter = ProfileEditWorryPresenter(
            viewController: viewController
        )
        let interactor = ProfileEditWorryInteractor(
            presenter: presenter,
            worker: worker
        )
        let router = ProfileEditWorryRouter(
            viewController: viewController,
            dataStore: interactor
        )
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}