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

import AppCore_DesignSystem
import SharedKit

public final class ProfileEditSceneBuilder {
    let dataStore = ProfileEditDataStore()

    lazy var nicknameSceneBuilder = ProfileEditNicknameScenBuilder(externalDataStore: dataStore)
    lazy var birthGenderSceneBuilder = ProfileEditBirthGenderScenBuilder(externalDataStore: dataStore)
    lazy var jobSceneBuilder = ProfileEditJobScenBuilder(externalDataStore: dataStore)
    lazy var worrySceneBuilder = ProfileEditWorryScenBuilder(externalDataStore: dataStore)

    // TODO: - 내비게이션 로직 추가 변경시 제거 필요 (DesignSystem import 제거)
    lazy var backBarButtonItemWithNoTitle = UIBarButtonItem(
        title: .init(),
        style: .plain,
        target: self,
        action: nil
    )

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
        setupNavigationBar()

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

extension ProfileEditSceneBuilder {
    private func setupNavigationBar() {
        navigationController.viewControllers
            .forEach { $0.navigationItem.backBarButtonItem = backBarButtonItemWithNoTitle }

        let backImage = UIImage.icon(icon: .caretLeft, size: .p24, color: .gray500)
        let barAppearance = UINavigationBarAppearance().then {
            $0.configureWithTransparentBackground()
            $0.shadowColor = .clear
            $0.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        }

        navigationController.do {
            $0.navigationBar.standardAppearance = barAppearance
            $0.navigationBar.scrollEdgeAppearance = barAppearance
            $0.navigationBar.compactAppearance = barAppearance
            $0.navigationBar.compactScrollEdgeAppearance = barAppearance
            $0.modalPresentationStyle = .fullScreen
        }
    }
}
