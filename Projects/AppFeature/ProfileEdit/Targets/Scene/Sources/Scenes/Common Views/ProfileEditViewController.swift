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
                make.top.equalToSuperview().offset(Const.topSpacing)
                make.directionalHorizontalEdges.equalToSuperview().inset(Const.contentInsets)
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

// MARK: - Const

extension ProfileEditViewController {
    var contentInsets: CGFloat {
        Const.contentInsets
    }

    enum Const {
        static let contentInsets = 20.0
        static let topSpacing = 30.0
    }
}
