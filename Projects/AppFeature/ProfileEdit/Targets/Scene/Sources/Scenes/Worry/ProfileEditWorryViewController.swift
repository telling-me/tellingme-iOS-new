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

protocol ProfileEditWorryDisplayLogic: AnyObject {}

final class ProfileEditWorryViewController: UIViewController {
    var interactor: (any ProfileEditWorryBusinessLogic)?
    var router: (any ProfileEditWorryRoutingLogic)?

    // MARK: - UI
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
}

// MARK: - Set up

extension ProfileEditWorryViewController {
    private func setUI() {
        view.backgroundColor = .white

        UILabel().do {
            $0.setText(text: "고민 화면", style: .body_01_B)
            view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        }
    }
}

// MARK: - Display Logic

extension ProfileEditWorryViewController: ProfileEditWorryDisplayLogic {
    
}

// MARK: - Scene

extension ProfileEditWorryViewController: ProfileEditWorryScene {
    
}
