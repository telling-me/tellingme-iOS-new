//
//  ProfileEditBirthGenderSceneBuilder.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
public protocol ProfileEditBirthGenderScene: AnyObject, Scene {
    
}

public struct ProfileEditBirthGenderConfiguration {
    
    public init() {}
    
}

public final class ProfileEditBirthGenderScenBuilder {
    private let externalDataStore: ProfileEditDataStore

    public init(externalDataStore: ProfileEditDataStore) {
        self.externalDataStore = externalDataStore
    }

    public func make(with configuration: ProfileEditBirthGenderConfiguration) -> ProfileEditBirthGenderScene {
        let viewController = ProfileEditBirthGenderViewController()
        let worker = ProfileEditBirthGenderWorker()
        let presenter = ProfileEditBirthGenderPresenter(
            viewController: viewController
        )
        let interactor = ProfileEditBirthGenderInteractor(
            presenter: presenter,
            worker: worker,
            externalDataStore: externalDataStore
        )
        let router = ProfileEditBirthGenderRouter(
            viewController: viewController,
            dataStore: interactor
        )
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
