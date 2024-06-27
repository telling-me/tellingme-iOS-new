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
    private var cancellables = Set<AnyCancellable>()

    var interactor: (any ProfileEditJobBusinessLogic)?
    var router: (any ProfileEditJobRoutingLogic)?
    var coordinator: (any ProfileEditJobSceneCoordinator)?

    private var jobs: [ProfileEditJob.Job] = ProfileEditJob.Job.allCases

    // MARK: - UI

    private let stackView = UIStackView()
    private let nextButton = BoxButton(text: "다음", attributes: .primaryLarge)

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coordinator?.setNavigationItems()
        self.setUI()
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

        stackView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.alignment = .fill
            $0.distribution = .fillEqually

            contentView.addSubview($0)
            $0.snp.makeConstraints { make in
                make.directionalHorizontalEdges.equalToSuperview().inset(horizontalInsets)
                make.top.equalTo(headerView.snp.bottom).offset(30)
                make.bottom.lessThanOrEqualToSuperview().inset(82)
            }
        }

        jobs.enumerated().forEach {
            let index = $0
            let selectBox = SelectBox(
                text: $1.rawValue,
                icon: .init(icon: $1.icon, size: .p24, color: nil)
            )

            selectBox.didTapPublisher
                .sink { [weak self] in self?.didTapSelectBox(selectBox, index: index) }
                .store(in: &cancellables)

            stackView.addArrangedSubview(selectBox)
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
}
