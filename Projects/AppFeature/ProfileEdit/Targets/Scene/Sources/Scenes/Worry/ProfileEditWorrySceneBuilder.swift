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

protocol ProfileEditWorrySceneCoordinatorProvider {
    func coordinator(viewController: UIViewController) -> ProfileEditWorrySceneCoordinator
}

public struct ProfileEditWorryConfiguration {
    let coordinatorProvider: ProfileEditWorrySceneCoordinatorProvider

    init(
        coordinatorProvider: ProfileEditWorrySceneCoordinatorProvider
    ) {
        self.coordinatorProvider = coordinatorProvider
    }
}

public final class ProfileEditWorryScenBuilder {
    private let externalDataStore: ProfileEditDataStore

    public init(externalDataStore: ProfileEditDataStore) {
        self.externalDataStore = externalDataStore
    }
    
    public func make(with configuration: ProfileEditWorryConfiguration) -> ProfileEditWorryScene {
        let viewController = ProfileEditWorryViewController()
        let worker = ProfileEditWorryWorker()
        let presenter = ProfileEditWorryPresenter(
            viewController: viewController
        )
        let interactor = ProfileEditWorryInteractor(
            presenter: presenter,
            worker: worker,
            externalDataStore: externalDataStore
        )
        let router = ProfileEditWorryRouter(
            viewController: viewController,
            dataStore: interactor
        )
        
        viewController.interactor = interactor
        viewController.router = router
        viewController.coordinator = configuration
            .coordinatorProvider
            .coordinator(viewController: viewController)

        return viewController
    }
}
