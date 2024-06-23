//
//  ProfileEditJobViewController.swift
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

protocol ProfileEditJobSceneCoordinator: ProfileEditSceneCoordinator {}

protocol ProfileEditJobDisplayLogic: AnyObject {}

final class ProfileEditJobViewController: ProfileEditViewController {
    var interactor: (any ProfileEditJobBusinessLogic)?
    var router: (any ProfileEditJobRoutingLogic)?
    var coordinator: (any ProfileEditJobSceneCoordinator)?

    // MARK: - UI

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coordinator?.setNavigationItems()
        self.setUI()
    }
}

// MARK: - Set up

extension ProfileEditJobViewController {
    private func setUI() {
        configureHeader(content: .job)

        UILabel()
            .do {
                $0.setText(text: "직업 화면", style: .body_01_B)
                contentView.addSubview($0)
                $0.snp.makeConstraints { make in
                    make.center.equalToSuperview()
                }
            }

        BoxButton(text: "다음", attributes: .primaryLarge)
            .do {
                contentView.addSubview($0)
                $0.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(100)
                }

                $0.setTapHandler { [weak self] in
                    guard let self else { return }

                    self.coordinator?.next()
                }
            }
    }
}

// MARK: - Display Logic

extension ProfileEditJobViewController: ProfileEditJobDisplayLogic {
    
}

// MARK: - Scene

extension ProfileEditJobViewController: ProfileEditJobScene {
    
}
