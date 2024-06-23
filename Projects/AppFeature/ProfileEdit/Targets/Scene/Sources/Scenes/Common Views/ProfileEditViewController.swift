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
    private let scrollView = UIScrollView()
    let contentView = UIView()
    let headerView = HeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

// MARK: - Set up

extension ProfileEditViewController {
    private func setupUI() {
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
                make.top.equalToSuperview().offset(30)
                make.directionalHorizontalEdges.equalToSuperview().inset(20)
            }
        }
    }
}

// MARK: - Configure

extension ProfileEditViewController {
    func configureHeader(content: HeaderView.Content) {
        headerView.configure(content: content)
    }
}
