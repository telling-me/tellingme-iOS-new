//
//  ProfileEditWorryViewController.swift
//  ProfileEdit
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

protocol ProfileEditWorrySceneCoordinator: ProfileEditSceneCoordinator {}

protocol ProfileEditWorryDisplayLogic: AnyObject {}

final class ProfileEditWorryViewController: ProfileEditViewController {
    var interactor: (any ProfileEditWorryBusinessLogic)?
    var router: (any ProfileEditWorryRoutingLogic)?
    var coordinator: (any ProfileEditWorrySceneCoordinator)?

    // MARK: - UI
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.coordinator?.setNavigationItems()
    }

    // MARK: - Set up

    override func setupUI() {
        super.setupUI()

        headerView.configure(content: .worry)
    }
}

// MARK: - Display Logic

extension ProfileEditWorryViewController: ProfileEditWorryDisplayLogic {
    
}

// MARK: - Scene

extension ProfileEditWorryViewController: ProfileEditWorryScene {
    
}
