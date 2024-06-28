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

    private var jobs: [ProfileEditJob.Job] = ProfileEditJob.Job.allCases

    // MARK: - UI

    private let stackView = UIStackView()
    private let nextButton = BoxButton(text: "다음", attributes: .primaryLarge)

    private var buttonBottomInsetConstraint: Constraint?

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coordinator?.setNavigationItems()
        self.setUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        bind()
    }

    // MARK: - Action

    private func didTapSelectBox(_ selectBox: SelectBox, index: Int) {
        resetSelectBoxes()
        selectBox.updateIsSelected(true)
        // TODO: - 데이터 업데이트
    }

    private func resetSelectBoxes() {
        stackView.arrangedSubviews
            .compactMap { $0 as? SelectBox }
            .forEach { $0.updateIsSelected(false) }
    }
}

// MARK: - Set up

extension ProfileEditJobViewController {
    private func setUI() {
        configureHeader(content: .job)

        configureKeyboardAnimation { [weak self] (duration, curve, height) in
            guard let self else { return }

            let buttonBottomInset = height == .zero ? buttonBottomInset : -buttonBottomInset
            let inset = height + buttonBottomInset
            buttonBottomInsetConstraint?.update(inset: inset)

            UIViewPropertyAnimator(
                duration: duration,
                curve: curve,
                animations: { self.view.layoutIfNeeded() }
            )
            .startAnimation()

            scrollView.setContentOffset(.init(x: .zero, y: 260), animated: true)
            scrollView.contentInset.bottom = inset
        }

        stackView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.alignment = .fill
            $0.distribution = .fill

            contentView.addSubview($0)
            $0.snp.makeConstraints { make in
                make.directionalHorizontalEdges.equalToSuperview().inset(horizontalInsets)
                make.top.equalTo(headerView.snp.bottom).offset(30)
                make.bottom.lessThanOrEqualToSuperview().inset(Const.bottomInset)
            }
        }

        jobs.enumerated().forEach {
            let index = $0
            let selectBox = SelectBox(
                text: $1.rawValue,
                icon: .init(icon: $1.icon, size: .p24, color: nil),
                inputPlaceholder: $1.placeholder
            )

            selectBox.didTapPublisher
                .sink { [weak self] in self?.didTapSelectBox(selectBox, index: index) }
                .store(in: &cancellables)

            stackView.addArrangedSubview(selectBox)
        }

        nextButton.do {
            $0.isEnabled = true

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
}

// MARK: - Display Logic

extension ProfileEditJobViewController: ProfileEditJobDisplayLogic {
    
}

// MARK: - Scene

extension ProfileEditJobViewController: ProfileEditJobScene {
    
}

// MARK: - Const

extension ProfileEditJobViewController {
    private enum Const {
        static let bottomInset = 82.0
    }
}

private extension ProfileEditJob.Job {
    var icon: Icon {
        switch self {
        case .중고등학생:
            return .bagpack
        case .대학생:
            return .graduationCap
        case .취업준비생:
            return .smiley
        case .직장인:
            return .briefcase
        case .주부:
            return .cookpot
        case .기타:
            return .etc
        }
    }

    var placeholder: String? {
        switch self {
        case .기타:
            return "하시는 일을 간단히 입력해주세요."
        default:
            return nil
        }
    }
}
