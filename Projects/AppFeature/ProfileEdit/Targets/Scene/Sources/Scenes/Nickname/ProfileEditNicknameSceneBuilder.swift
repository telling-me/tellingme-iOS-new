//
//  ProfileEditNicknameSceneBuilder.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
public protocol ProfileEditNicknameScene: AnyObject, Scene {
    
}

public struct ProfileEditNicknameConfiguration {
    
    public init() {}
    
}

final class ProfileEditNicknameScenBuilder {
    private let externalDataStore: ProfileEditDataStore

    public init(externalDataStore: ProfileEditDataStore) {
        self.externalDataStore = externalDataStore
    }

    public func make(with configuration: ProfileEditNicknameConfiguration) -> ProfileEditNicknameScene {
        let viewController = ProfileEditNicknameViewController()
        let worker = ProfileEditNicknameWorker()
        let presenter = ProfileEditNicknamePresenter(
            viewController: viewController
        )
        let interactor = ProfileEditNicknameInteractor(
            presenter: presenter,
            worker: worker,
            externalDataStore: externalDataStore
        )
        let router = ProfileEditNicknameRouter(
            viewController: viewController,
            dataStore: interactor
        )
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
