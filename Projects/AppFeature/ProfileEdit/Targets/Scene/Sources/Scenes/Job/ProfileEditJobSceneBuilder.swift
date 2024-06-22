//
//  ProfileEditJobSceneBuilder.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
public protocol ProfileEditJobScene: AnyObject, Scene {
    
}

public struct ProfileEditJobConfiguration {
    
    public init() {}
    
}

public final class ProfileEditJobScenBuilder {
    
    public init() {}
    
    public func make(with configuration: ProfileEditJobConfiguration) -> ProfileEditJobScene {
        let viewController = ProfileEditJobViewController()
        let worker = ProfileEditJobWorker()
        let presenter = ProfileEditJobPresenter(
            viewController: viewController
        )
        let interactor = ProfileEditJobInteractor(
            presenter: presenter,
            worker: worker
        )
        let router = ProfileEditJobRouter(
            viewController: viewController,
            dataStore: interactor
        )
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}