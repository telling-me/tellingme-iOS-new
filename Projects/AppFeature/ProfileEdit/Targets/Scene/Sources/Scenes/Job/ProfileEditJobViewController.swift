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

protocol ProfileEditJobDisplayLogic: AnyObject {
    func displayJob(selectedIndex: Int?, etc: String?, isNextButtonEnabled: Bool)
}

final class ProfileEditJobViewController: ProfileEditViewController {
    var interactor: (any ProfileEditJobBusinessLogic)?
    var router: (any ProfileEditJobRoutingLogic)?
    var coordinator: (any ProfileEditJobSceneCoordinator)?

    private let jobs: [ProfileEditJob.Job] = ProfileEditJob.Job.allCases

    // MARK: - UI

    private let stackView = UIStackView()

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.coordinator?.setNavigationItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        interactor?.loadIfNeeded()
    }

    // MARK: - Set up

    override func setupUI() {
        super.setupUI()

        headerView.configure(content: .job)

        configureKeyboardAnimation { [weak self] (_, _, height) in
            guard let self else { return }

            let willShow = height != .zero

            scrollView.setContentOffset(
                .init(x: .zero, y: willShow ? 260 : .zero),
                animated: true
            )
            scrollView.contentInset.bottom = height + buttonBottomInset
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

            selectBox.inputPublisher?
                .sink { [weak self] in self?.interactor?.storeJob(selectedJob: .기타, etc: $0) }
                .store(in: &cancellables)

            stackView.addArrangedSubview(selectBox)
        }

        nextButton.setTapHandler { [weak self] in
            self?.coordinator?.next()
        }
    }

    // MARK: - Action

    private func didTapSelectBox(_ selectBox: SelectBox, index: Int) {
        let selectedJob = jobs[index]
        let etc = selectBox.inputText
        interactor?.storeJob(selectedJob: selectedJob, etc: etc)
        
        if selectedJob == .기타 {
            selectBox.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
    }
}

// MARK: - Display Logic

extension ProfileEditJobViewController: ProfileEditJobDisplayLogic {
    func displayJob(selectedIndex: Int?, etc: String?, isNextButtonEnabled: Bool) {
        guard let selectedIndex, selectedIndex < selectBoxes.count
        else { return }

        resetSelectBoxes()
        
        let selectedSelectBox = selectBoxes[selectedIndex]
        selectedSelectBox.updateIsSelected(true)
        selectedSelectBox.updateInput(etc ?? "")

        nextButton.isEnabled = isNextButtonEnabled
    }
}

extension ProfileEditJobViewController {
    private func resetSelectBoxes() {
        selectBoxes.forEach { $0.updateIsSelected(false) }
    }

    private var selectBoxes: [SelectBox] {
        stackView.arrangedSubviews
            .compactMap { $0 as? SelectBox }
    }
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
