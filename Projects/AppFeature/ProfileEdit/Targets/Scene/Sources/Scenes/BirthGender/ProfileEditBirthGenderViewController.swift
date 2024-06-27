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

protocol ProfileEditBirthGenderDisplayLogic: AnyObject {
    func displayBirthGender(birth: String?, gender: EditingProfile.Gender?)
    func displayBirthValidity(_ validity: InputField.Validity)
    func displayNextButton(isEnabled: Bool)
}

final class ProfileEditBirthGenderViewController: ProfileEditViewController {
    private var cancellables = Set<AnyCancellable>()

    var interactor: (any ProfileEditBirthGenderBusinessLogic)?
    var router: (any ProfileEditBirthGenderRoutingLogic)?
    var coordinator: (any ProfileEditBirthGenderSceneCoordinator)?

    // MARK: - UI

    private let birthInput = InputField()
    private let genderStackView = UIStackView()
    private let maleSelectBox = SelectBox(text: "남성")
    private let femaleSelectBox = SelectBox(text: "여성")

    // TODO: 공통화 작업 필요
    private let nextButton = BoxButton(text: "다음", attributes: .primaryLarge)
    
    private var buttonBottomInsetConstraint: Constraint?

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        coordinator?.setNavigationItems()
        setUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor?.loadIfNeeded()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        bind()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        cancellables.removeAll()
    }

    @objc private func didTapMaleSelectBox() {
        resetSelectBox()
        interactor?.selectGender(.male)
        maleSelectBox.updateIsSelected(true)
    }

    @objc private func didTapFemaleSelectBox() {
        resetSelectBox()
        interactor?.selectGender(.female)
        femaleSelectBox.updateIsSelected(true)
    }

    private func resetSelectBox() {
        maleSelectBox.updateIsSelected(false)
        femaleSelectBox.updateIsSelected(false)
    }
}

// MARK: - Set up

extension ProfileEditBirthGenderViewController {
    private func setUI() {
        configureHeader(content: .birthGender)

        birthInput.do {
            $0.updateKeyboardType(.numberPad)
            $0.setMaxCount(Const.birthMaxCount)
            $0.updatePlaceholder(Const.birthPlaceholder)

            contentView.addSubview($0)
            $0.snp.makeConstraints { make in
                make.top.equalTo(headerView.snp.bottom).offset(Const.birthInputTopSpacing)
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

        genderStackView.do {
            $0.axis = .horizontal
            $0.spacing = 11
            $0.alignment = .center
            $0.distribution = .fillEqually

            contentView.addSubview($0)
            $0.snp.makeConstraints { make in
                make.top.equalTo(headerView.snp.bottom).offset(Const.headerViewSelectViewSpacing)
                make.directionalHorizontalEdges.equalToSuperview().inset(horizontalInsets)
            }
        }

        maleSelectBox.do {
            $0.didTapPublisher
                .sink { [weak self] in self?.didTapMaleSelectBox() }
                .store(in: &cancellables)

            genderStackView.addArrangedSubview($0)
        }

        femaleSelectBox.do {
            $0.didTapPublisher
                .sink { [weak self] in self?.didTapFemaleSelectBox() }
                .store(in: &cancellables)

            genderStackView.addArrangedSubview($0)
        }
    }

    private func bind() {
        Publishers.Merge(
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification),
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        )
        .sink { [weak self] in self?.animateButton(notification: $0) }
        .store(in: &cancellables)

        birthInput.editingDidEndPublisher
            .removeDuplicates()
            .sink { [weak self] in self?.interactor?.verifyBirth($0) }
            .store(in: &cancellables)

        birthInput.textPublisher
            .removeDuplicates()
            .sink { [weak self] in self?.interactor?.verifyBirth($0) }
            .store(in: &cancellables)
    }
}

extension ProfileEditBirthGenderViewController {
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

extension ProfileEditBirthGenderViewController: ProfileEditBirthGenderDisplayLogic {
    func displayBirthGender(birth: String?, gender: EditingProfile.Gender?) {
        if let birth {
            birthInput.setText(birth)
        }
        
        if let gender {
            resetSelectBox()
            
            switch gender {
            case .male:
                maleSelectBox.updateIsSelected(true)
            case .female:
                femaleSelectBox.updateIsSelected(true)
            }
        }
    }

    func displayBirthValidity(_ validity: InputField.Validity) {
        birthInput.updateValidity(validity)
    }

    func displayNextButton(isEnabled: Bool) {
        nextButton.isEnabled = isEnabled
    }
}

// MARK: - Scene

extension ProfileEditBirthGenderViewController: ProfileEditBirthGenderScene {
    
}


// MARK: - Const

extension ProfileEditBirthGenderViewController {
    private enum Const {
        static let birthMaxCount = 4
        static let birthPlaceholder = "출생연도 \(birthMaxCount)자리"

        static let birthInputTopSpacing = 55.0
        static let headerViewSelectViewSpacing = 135.0
    }
}
