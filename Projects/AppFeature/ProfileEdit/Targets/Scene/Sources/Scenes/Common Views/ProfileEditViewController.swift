//
//  ProfileEditViewController.swift
//  ProfileEditScene
//
//  Created by Woody Lee on 6/23/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Combine
import SnapKit
import Then
import UIKit

import AppCore_DesignSystem
import SharedKit

class ProfileEditViewController: UIViewController {
    var cancellables = Set<AnyCancellable>()

    let scrollView = UIScrollView()
    let contentView = UIView()
    let headerView = HeaderView()

    private var keyboardAnimationHandler: KeyboardAnimationHandler?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        bind()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        view.endEditing(true)
    }

    func setupUI() {
        view.backgroundColor = .white

        scrollView.do {
            $0.delaysContentTouches = false
            $0.alwaysBounceVertical = false

            view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.directionalEdges.equalTo(view.safeAreaLayoutGuide)
            }
        }

        contentView.do {
            scrollView.addSubview($0)
            $0.snp.makeConstraints { make in
                make.directionalEdges.equalToSuperview()
                make.width.equalToSuperview()
                make.height.equalToSuperview().priority(.init(200))
            }
        }

        headerView.do {
            contentView.addSubview($0)

            $0.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(Const.topSpacing)
                make.directionalHorizontalEdges.equalToSuperview().inset(Const.contentInsets)
            }
        }
    }

    func bind() {
        NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .sink { [weak self] in self?.animateButton(notification: $0) }
            .store(in: &cancellables)

        NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .sink { [weak self] in self?.animateButton(notification: $0) }
            .store(in: &cancellables)
    }
}

// MARK: - Header

extension ProfileEditViewController {
    func configureHeader(content: HeaderView.Content) {
        headerView.configure(content: content)
    }
}

// MARK: - Keyboard animation

extension ProfileEditViewController {
    typealias KeyboardAnimationTuple = (Double, UIView.AnimationCurve, CGFloat)
    typealias KeyboardAnimationHandler = (KeyboardAnimationTuple) -> Void

    func configureKeyboardAnimation(_ animationHandler: @escaping KeyboardAnimationHandler) {
        self.keyboardAnimationHandler = animationHandler
    }

    private func animateButton(notification: Notification) {
        guard let (duration, curve, height) = getAnimationProperties(notification: notification)
        else { return }

        keyboardAnimationHandler?((duration, curve, height))
    }

    private func getAnimationProperties(notification: Notification) -> KeyboardAnimationTuple? {
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

// MARK: - Const

extension ProfileEditViewController {
    var horizontalInsets: CGFloat {
        Const.contentInsets
    }

    var buttonBottomInset: CGFloat {
        Const.buttonBottomInset
    }

    enum Const {
        static let contentInsets = 20.0
        static let topSpacing = 30.0
        static let buttonBottomInset = 16.0
    }
}
