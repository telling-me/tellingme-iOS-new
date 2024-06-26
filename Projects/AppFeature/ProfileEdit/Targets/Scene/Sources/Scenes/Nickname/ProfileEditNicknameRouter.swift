//
//  ProfileEditNicknameRouter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
protocol ProfileEditNicknameRoutingLogic {
    func showAgree()
}

final class ProfileEditNicknameRouter {
    private weak var viewController: ProfileEditNicknameViewController?
    private let dataStore: any ProfileEditNicknameDataStore
    private let coordinator: any ProfileEditNicknameSceneCoordinator

    init(
        viewController: ProfileEditNicknameViewController?,
        dataStore: any ProfileEditNicknameDataStore,
        coordinator: any ProfileEditNicknameSceneCoordinator
    ) {
        self.viewController = viewController
        self.dataStore = dataStore
        self.coordinator = coordinator
    }
}

extension ProfileEditNicknameRouter: ProfileEditNicknameRoutingLogic {
    func showAgree() {
        let agreeViewController = ProfileEditAgreeViewController
            .init(completionHandler: { [weak self] in self?.coordinator.next() })

        if let sheet = agreeViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20.0
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
        }

        viewController?.present(agreeViewController, animated: true)
    }
}
