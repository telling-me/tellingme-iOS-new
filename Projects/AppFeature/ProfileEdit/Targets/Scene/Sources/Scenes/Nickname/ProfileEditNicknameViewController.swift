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
    func displayNicknameValidity(_ validity: InputField.Validity)
}

final class ProfileEditNicknameViewController: ProfileEditViewController {
    private var cancellables = Set<AnyCancellable>()

    var interactor: (any ProfileEditNicknameBusinessLogic)?
    var router: (any ProfileEditNicknameRoutingLogic)?
    var coordinator: (any ProfileEditNicknameSceneCoordinator)?

    // MARK: - UI

    private let nicknameInput = InputField()
    private let nextButton = BoxButton(text: "다음", attributes: .primaryLarge)

    private var buttonBottomInsetConstraint: Constraint?

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coordinator?.setNavigationItems()
        setUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        bind()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        cancellables.removeAll()
    }
}

// MARK: - Set up

extension ProfileEditNicknameViewController {
    private func setUI() {
        configureHeader(content: .nickname)

        nicknameInput.do {
            $0.setMaxCount(Const.nicknameMaxCount)
            $0.updatePlaceholder(Const.nicknameInputPlaceholder)

            contentView.addSubview(nicknameInput)
            nicknameInput.snp.makeConstraints { make in
                make.top.equalTo(headerView.snp.bottom).offset(Const.nicknameTopSpacing)
                make.directionalHorizontalEdges.equalToSuperview().inset(horizontalInsets)
            }
        }

        nextButton.do {
            $0.isEnabled = false

            view.addSubview($0)
            $0.snp.makeConstraints { make in
                buttonBottomInsetConstraint = make.bottom
                    .equalTo(view.safeAreaLayoutGuide)
                    .inset(buttonBottomInset)
                    .constraint
                make.directionalHorizontalEdges.equalToSuperview().inset(horizontalInsets)
            }

            $0.setTapHandler { [weak self] in
                self?.coordinator?.next()
            }
        }
    }

    private func bind() {
        Publishers.Merge(
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification),
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        )
        .sink { [weak self] in self?.animateButton(notification: $0) }
        .store(in: &cancellables)

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

extension ProfileEditNicknameViewController {
    private func animateButton(notification: Notification) {
        guard let (duration, curve, height) = getAnimationProperties(notification: notification) else { return }

        let buttonBottomInset = height == .zero ? buttonBottomInset : -buttonBottomInset
        let inset = height + buttonBottomInset
        buttonBottomInsetConstraint?.update(inset: inset)

        UIViewPropertyAnimator(
            duration: duration,
            curve: curve,
            animations: { self.view.layoutIfNeeded() }
        )
        .startAnimation()
    }

    private func getAnimationProperties(notification: Notification) -> (Double, UIView.AnimationCurve, CGFloat)? {
        let willHideNotificationName = UIResponder.keyboardWillHideNotification
        let durationKey = UIResponder.keyboardAnimationDurationUserInfoKey
        let curveKey = UIResponder.keyboardAnimationCurveUserInfoKey
        let frameKey = UIResponder.keyboardFrameEndUserInfoKey

        guard let userInfo = notification.userInfo,
              let duration = userInfo[durationKey] as? Double,
              let curveValue = userInfo[curveKey] as? Int,
              let curve = UIView.AnimationCurve(rawValue: curveValue),
              let keyboardFrame = userInfo[frameKey] as? CGRect
        else { return nil }

        let height: CGFloat = notification.name == willHideNotificationName ? .zero : keyboardFrame.height
        return (duration, curve, height)
    }
}

// MARK: - Display Logic

extension ProfileEditNicknameViewController: ProfileEditNicknameDisplayLogic {
    func displayNicknameValidity(_ validity: InputField.Validity) {
        nicknameInput.updateValidity(validity)
        nextButton.isEnabled = validity == .valid || nicknameInput.text.isEmpty == false
    }
}

// MARK: - Scene

extension ProfileEditNicknameViewController: ProfileEditNicknameScene {

}

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
