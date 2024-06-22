//
//  ProfileEditBirthGenderViewController.swift
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

protocol ProfileEditBirthGenderSceneCoordinator: ProfileEditSceneCoordinator {}

protocol ProfileEditBirthGenderDisplayLogic: AnyObject {}

final class ProfileEditBirthGenderViewController: UIViewController {
    var interactor: (any ProfileEditBirthGenderBusinessLogic)?
    var router: (any ProfileEditBirthGenderRoutingLogic)?
    var coordinator: (any ProfileEditBirthGenderSceneCoordinator)?

    // MARK: - UI
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
}

// MARK: - Set up

extension ProfileEditBirthGenderViewController {
    private func setUI() {
        view.backgroundColor = .white

        UILabel()
            .do {
                $0.setText(text: "생일/성별 화면", style: .body_01_B)
                view.addSubview($0)
                $0.snp.makeConstraints { make in
                    make.center.equalToSuperview()
                }
            }

        BoxButton(text: "다음", attributes: .primaryLarge)
            .do {
                view.addSubview($0)
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

extension ProfileEditBirthGenderViewController: ProfileEditBirthGenderDisplayLogic {
    
}

// MARK: - Scene

extension ProfileEditBirthGenderViewController: ProfileEditBirthGenderScene {
    
}
