//
//  ProfileEditNicknameViewController.swift
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

protocol ProfileEditNicknameSceneCoordinator: ProfileEditSceneCoordinator {}

protocol ProfileEditNicknameDisplayLogic: AnyObject {}

final class ProfileEditNicknameViewController: UIViewController {
    var interactor: (any ProfileEditNicknameBusinessLogic)?
    var router: (any ProfileEditNicknameRoutingLogic)?
    var coordinator: (any ProfileEditNicknameSceneCoordinator)?

    // MARK: - UI
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coordinator?.setNavigationItems()
        self.setUI()
    }
}

// MARK: - Set up

extension ProfileEditNicknameViewController {
    private func setUI() {
        view.backgroundColor = .white

        UILabel()
            .do {
                $0.setText(text: "닉네임 화면", style: .body_01_B)
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

extension ProfileEditNicknameViewController: ProfileEditNicknameDisplayLogic {
    
}

// MARK: - Scene

extension ProfileEditNicknameViewController: ProfileEditNicknameScene {

}
