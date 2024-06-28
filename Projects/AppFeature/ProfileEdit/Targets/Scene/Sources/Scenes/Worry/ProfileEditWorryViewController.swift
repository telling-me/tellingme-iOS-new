//
//  ProfileEditWorryViewController.swift
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

protocol ProfileEditWorrySceneCoordinator: ProfileEditSceneCoordinator {}

protocol ProfileEditWorryDisplayLogic: AnyObject {
    func displayWorryList(selectedIndices: [Int])
    func displayToast()
}

final class ProfileEditWorryViewController: ProfileEditViewController {
    var interactor: (any ProfileEditWorryBusinessLogic)?
    var router: (any ProfileEditWorryRoutingLogic)?
    var coordinator: (any ProfileEditWorrySceneCoordinator)?

    private var worryList: [ProfileEditWorry.Worry] = ProfileEditWorry.Worry.allCases

    // MARK: - UI

    private let stackView = UIStackView()

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coordinator?.setNavigationItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        interactor?.loadIfNeeded()
    }

    // MARK: - Set up

    override func setupUI() {
        super.setupUI()

        headerView.configure(content: .worry)

        stackView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.alignment = .fill
            $0.distribution = .fill

            contentView.addSubview($0)
            $0.snp.makeConstraints { make in
                make.directionalHorizontalEdges.equalToSuperview().inset(horizontalInsets)
                make.top.equalTo(headerView.snp.bottom).offset(30)
                make.bottom.lessThanOrEqualToSuperview().inset(82)
            }
        }

        worryList.enumerated().forEach {
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

        nextButton.do {
            $0.setText("완료")

            $0.setTapHandler { [weak self] in
                self?.coordinator?.next()
            }
        }
    }

    // MARK: - Action

    private func didTapSelectBox(_ selectBox: SelectBox, index: Int) {
        let selectedJob = worryList[index]
        interactor?.storeWorry(selectedWorry: selectedJob)
    }
}

// MARK: - Display Logic

extension ProfileEditWorryViewController: ProfileEditWorryDisplayLogic {
    func displayWorryList(selectedIndices: [Int]) {
        guard selectedIndices.allSatisfy({ $0 < selectBoxes.count }) else { return }
        
        resetSelectBoxes()

        for selectedIndex in selectedIndices {
            selectBoxes[selectedIndex].updateIsSelected(true)
        }

        nextButton.isEnabled = selectedIndices.count == 2
    }

    func displayToast() {
        ToastPresenter.shared.showToast(
            message: "최대 2가지만 선택 가능해요.",
            icon: .icon(icon: .warn, size: .p24, color: nil)
        )
    }
}

extension ProfileEditWorryViewController {
    private func resetSelectBoxes() {
        selectBoxes.forEach { $0.updateIsSelected(false) }
    }

    private var selectBoxes: [SelectBox] {
        stackView.arrangedSubviews
            .compactMap { $0 as? SelectBox }
    }
}

// MARK: - Scene

extension ProfileEditWorryViewController: ProfileEditWorryScene {
    
}

// MARK: - Const

private extension ProfileEditWorry.Worry {
    var icon: Icon {
        switch self {
        case .학업진로:
            return .pen
        case .대인관계:
            return .handshake
        case .성격가치관:
            return .values
        case .행동습관:
            return .magnet
        case .건강:
            return .health
        case .기타:
            return .etc
        }
    }
}
