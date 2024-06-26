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

protocol ProfileEditJobSceneCoordinatorProvider {
    func coordinator(viewController: UIViewController) -> ProfileEditJobSceneCoordinator
}

public struct ProfileEditJobConfiguration {
    let coordinatorProvider: ProfileEditJobSceneCoordinatorProvider

    init(
        coordinatorProvider: ProfileEditJobSceneCoordinatorProvider
    ) {
        self.coordinatorProvider = coordinatorProvider
    }
}

public final class ProfileEditJobScenBuilder {
    private let externalDataStore: ProfileEditDataStore

    public init(externalDataStore: ProfileEditDataStore) {
        self.externalDataStore = externalDataStore
    }

    public func make(with configuration: ProfileEditJobConfiguration) -> ProfileEditJobScene {
        let viewController = ProfileEditJobViewController()
        let worker = ProfileEditJobWorker()
        let presenter = ProfileEditJobPresenter(
            viewController: viewController
        )
        let interactor = ProfileEditJobInteractor(
            presenter: presenter,
            worker: worker,
            externalDataStore: externalDataStore
        )
        let router = ProfileEditJobRouter(
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
