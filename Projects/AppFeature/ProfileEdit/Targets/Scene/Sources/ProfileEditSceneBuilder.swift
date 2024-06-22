//
//  ProfileEditSceneBuilder.swift
//  
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Combine
import SnapKit
import Then
import UIKit

import SharedKit

public final class ProfileEditSceneBuilder {
    let dataStore = ProfileEditDataStore()

    lazy var nicknameSceneBuilder = ProfileEditNicknameScenBuilder(externalDataStore: dataStore)
    lazy var birthGenderSceneBuilder = ProfileEditBirthGenderScenBuilder(externalDataStore: dataStore)
    lazy var jobSceneBuilder = ProfileEditJobScenBuilder(externalDataStore: dataStore)
    lazy var worrySceneBuilder = ProfileEditWorryScenBuilder(externalDataStore: dataStore)

    let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension ProfileEditSceneBuilder {
    public func showProfileEditScene(
        from viewController: UIViewController
    ) {
        let startViewController = nicknameViewController()

        // Note: Set up navigation (로그인에서 설정된다면 제거 필요)
        let barAppearance = UINavigationBarAppearance().then {
            $0.configureWithOpaqueBackground()
            $0.shadowColor = .clear
        }

        navigationController.do {
            $0.navigationBar.standardAppearance = barAppearance
            $0.modalPresentationStyle = .fullScreen
        }

        navigationController.pushViewController(
            startViewController,
            animated: true
        )
    }
}

extension ProfileEditSceneBuilder {
    func nicknameViewController() -> UIViewController {
        nicknameSceneBuilder
            .make(with: .init(
                coordinatorProvider: ProfileEditCoordinator.Nickname.Provider(sceneBuilder: self)
            ))
            .viewController
    }

    func birthGenderViewController() -> UIViewController {
        let provider = ProfileEditCoordinator.BirthGender.Provider(sceneBuilder: self)

        return birthGenderSceneBuilder
            .make(with: .init(coordinatorProvider: provider))
            .viewController

    }

    func jobViewController() -> UIViewController { 
        let provider = ProfileEditCoordinator.Job.Provider(sceneBuilder: self)

        return jobSceneBuilder
            .make(with: .init(coordinatorProvider: provider))
            .viewController
    }

    func worryViewController() -> UIViewController { 
        let provider = ProfileEditCoordinator.Worry.Provider(sceneBuilder: self)

        return worrySceneBuilder
            .make(with: .init(coordinatorProvider: provider))
            .viewController
    }
}
