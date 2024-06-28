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

protocol ProfileEditNicknameDisplayLogic: AnyObject {
    func displayNickname(_ nickname: String?)
    func displayNicknameValidity(_ validity: InputField.Validity)
}

final class ProfileEditNicknameViewController: ProfileEditViewController {
    var interactor: (any ProfileEditNicknameBusinessLogic)?
    var router: (any ProfileEditNicknameRoutingLogic)?
    var coordinator: (any ProfileEditNicknameSceneCoordinator)?

    // MARK: - UI

    private let nicknameInput = InputField()

    private var buttonBottomInsetConstraint: Constraint?

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coordinator?.setNavigationItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        interactor?.loadIfNeeded()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        nicknameInput.becomeFirstResponder()
    }

    // MARK: - Set up

    override func setupUI() {
        super.setupUI()

        headerView.configure(content: .nickname)

        nicknameInput.do {
            $0.setMaxCount(Const.nicknameMaxCount)
            $0.updatePlaceholder(Const.nicknameInputPlaceholder)

            contentView.addSubview(nicknameInput)
            nicknameInput.snp.makeConstraints { make in
                make.top.equalTo(headerView.snp.bottom).offset(Const.nicknameTopSpacing)
                make.directionalHorizontalEdges.equalToSuperview().inset(horizontalInsets)
            }
        }

        nextButton.setTapHandler { [weak self] in
            self?.coordinator?.next()
        }
    }

    // MARK: - Bind

    override func bind() {
        super.bind()

        nicknameInput.editingDidEndPublisher
            .removeDuplicates()
            .sink { [weak self] in self?.interactor?.verifyNickname($0) }
            .store(in: &cancellables)

        nicknameInput.textPublisher
            .removeDuplicates()
            .sink { [weak self] in self?.interactor?.verifyNickname($0) }
            .store(in: &cancellables)
    }
}

// MARK: - Display Logic

extension ProfileEditNicknameViewController: ProfileEditNicknameDisplayLogic {
    func displayNickname(_ nickname: String?) {
        nicknameInput.setText(nickname ?? "")
    }

    func displayNicknameValidity(_ validity: InputField.Validity) {
        nicknameInput.updateValidity(validity)
        nextButton.isEnabled = validity == .valid || nicknameInput.text.isEmpty == false
    }
}

// MARK: - Scene

extension ProfileEditNicknameViewController: ProfileEditNicknameScene {}

// MARK: - Const

extension ProfileEditNicknameViewController {
    private enum Const {
        static let nicknameMinCount = ProfileEditNickname.Const.nicknameMinCount
        static let nicknameMaxCount = ProfileEditNickname.Const.nicknameMaxCount
        static let nicknameInputPlaceholder =
        "\(nicknameMinCount)-\(nicknameMaxCount)자 이내 (영문, 숫자, 특수문자 제외)"

        static let nicknameTopSpacing = 30.0
    }
}
