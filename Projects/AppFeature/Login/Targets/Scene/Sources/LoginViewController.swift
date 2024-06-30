//
//  LoginViewController.swift
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
import ProfileEditScene
import SharedKit

protocol LoginDisplayLogic: AnyObject {}

final class LoginViewController: UIViewController {
    var interactor: (any LoginBusinessLogic)?
    var router: (any LoginRoutingLogic)?

    // MARK: - UI

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
}

// MARK: - Set up

extension LoginViewController {
    private func setUI() {
        // TODO: - 로그인 UI 그리기
        BoxButton(text: "회원가입 플로우", attributes: .primaryLarge)
            .do {
                view.addSubview($0)
                $0.snp.makeConstraints { make in
                    make.center.equalToSuperview()
                }

                $0.setTapHandler { [weak self] in
                    guard let self,
                          let navigationController
                    else { return }

                    ProfileEditSceneBuilder(
                        navigationController: navigationController
                    )
                    .showProfileEditScene(
                        socialType: .kakao,
                        from: self
                    )
                }
            }
    }
}

// MARK: - Display Logic

extension LoginViewController: LoginDisplayLogic {

}

// MARK: - Scene

extension LoginViewController: LoginScene {

}
