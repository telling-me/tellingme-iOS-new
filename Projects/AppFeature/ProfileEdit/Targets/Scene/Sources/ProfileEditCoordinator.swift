//
//  ProfileEditCoordinator.swift
//  ProfileEditScene
//
//  Created by Woody Lee on 6/22/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

import AppCore_DesignSystem

enum ProfileEditCoordinator { }

protocol ProfileEditSceneCoordinator: AnyObject {
    var sceneBuilder: ProfileEditSceneBuilder { get }
    var viewController: UIViewController? { get }

    func next()
    func setNavigationItems()
}

extension ProfileEditSceneCoordinator {
    var navigationController: UINavigationController {
        sceneBuilder.navigationController
    }
}

extension ProfileEditSceneCoordinator {
    func setNavigationLeftBarItem(selector: Selector) {
        viewController?
            .navigationItem
            .backBarButtonItem = .init(
                title: .init(),
                style: .plain,
                target: self,
                action: selector
            )
    }

    func present(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - Common

extension ProfileEditCoordinator {
    class Common {
        var sceneBuilder: ProfileEditSceneBuilder

        init(sceneBuilder: ProfileEditSceneBuilder) {
            self.sceneBuilder = sceneBuilder
        }
    }
}

extension ProfileEditCoordinator.Common {
    @objc func back() {
        sceneBuilder
            .navigationController
            .popViewController(animated: true)
    }
}

// MARK: - Nickname

extension ProfileEditCoordinator {
    final class Nickname: Common {
        weak var viewController: UIViewController?

        init(
            sceneBuilder: ProfileEditSceneBuilder,
            viewController: UIViewController?
        ) {
            self.viewController = viewController
            super.init(sceneBuilder: sceneBuilder)
        }
    }
}

extension ProfileEditCoordinator.Nickname: ProfileEditSceneCoordinator {
    func next() {
        present(sceneBuilder.birthGenderViewController())
    }

    func setNavigationItems() {
        setNavigationLeftBarItem(selector: #selector(back))
    }
}

extension ProfileEditCoordinator.Nickname: ProfileEditNicknameSceneCoordinator {}

extension ProfileEditCoordinator.Nickname {
    struct Provider: ProfileEditNicknameSceneCoordinatorProvider {
        let sceneBuilder: ProfileEditSceneBuilder

        func coordinator(
            viewController: UIViewController
        ) -> any ProfileEditNicknameSceneCoordinator {
            ProfileEditCoordinator.Nickname(
                sceneBuilder: sceneBuilder,
                viewController: viewController
            )
        }
    }
}

// MARK: - BirthGender

extension ProfileEditCoordinator {
    final class BirthGender: Common {
        weak var viewController: UIViewController?

        init(
            sceneBuilder: ProfileEditSceneBuilder,
            viewController: UIViewController?
        ) {
            self.viewController = viewController
            super.init(sceneBuilder: sceneBuilder)
        }
    }
}

extension ProfileEditCoordinator.BirthGender: ProfileEditSceneCoordinator {
    func next() {
        present(sceneBuilder.jobViewController())
    }

    func setNavigationItems() {
        setNavigationLeftBarItem(selector: #selector(back))
    }
}

extension ProfileEditCoordinator.BirthGender: ProfileEditBirthGenderSceneCoordinator {}

extension ProfileEditCoordinator.BirthGender {
    struct Provider: ProfileEditBirthGenderSceneCoordinatorProvider {
        let sceneBuilder: ProfileEditSceneBuilder

        func coordinator(
            viewController: UIViewController
        ) -> any ProfileEditBirthGenderSceneCoordinator {
            ProfileEditCoordinator.BirthGender(
                sceneBuilder: sceneBuilder,
                viewController: viewController
            )
        }
    }
}

// MARK: - Job

extension ProfileEditCoordinator {
    final class Job: Common {
        weak var viewController: UIViewController?

        init(
            sceneBuilder: ProfileEditSceneBuilder,
            viewController: UIViewController?
        ) {
            self.viewController = viewController
            super.init(sceneBuilder: sceneBuilder)
        }
    }
}

extension ProfileEditCoordinator.Job: ProfileEditSceneCoordinator {
    func next() {
        present(sceneBuilder.worryViewController())
    }

    func setNavigationItems() {
        setNavigationLeftBarItem(selector: #selector(back))
    }
}

extension ProfileEditCoordinator.Job: ProfileEditJobSceneCoordinator {}

extension ProfileEditCoordinator.Job {
    struct Provider: ProfileEditJobSceneCoordinatorProvider {
        let sceneBuilder: ProfileEditSceneBuilder

        func coordinator(
            viewController: UIViewController
        ) -> any ProfileEditJobSceneCoordinator {
            ProfileEditCoordinator.Job(
                sceneBuilder: sceneBuilder,
                viewController: viewController
            )
        }
    }
}

// MARK: - Worry

extension ProfileEditCoordinator {
    final class Worry: Common, ProfileEditSceneCoordinator {
        weak var viewController: UIViewController?

        init(
            sceneBuilder: ProfileEditSceneBuilder,
            viewController: UIViewController?
        ) {
            self.viewController = viewController
            super.init(sceneBuilder: sceneBuilder)
        }
    }
}

extension ProfileEditCoordinator.Worry {
    func next() {
        // TODO: 메인으로 넘어가는 화면 전환 구현
    }

    func setNavigationItems() {
        setNavigationLeftBarItem(selector: #selector(back))
    }
}

extension ProfileEditCoordinator.Worry: ProfileEditWorrySceneCoordinator {}

extension ProfileEditCoordinator.Worry {
    struct Provider: ProfileEditWorrySceneCoordinatorProvider {
        let sceneBuilder: ProfileEditSceneBuilder

        func coordinator(
            viewController: UIViewController
        ) -> any ProfileEditWorrySceneCoordinator {
            ProfileEditCoordinator.Worry(
                sceneBuilder: sceneBuilder,
                viewController: viewController
            )
        }
    }
}
