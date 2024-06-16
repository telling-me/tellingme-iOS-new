//
//  ButtonViewController.swift
//  TellingMe-DesignSystem-App
//
//  Created by max on 6/16/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import SnapKit
import Then
import UIKit

import AppCore_DesignSystem

final class ButtonViewController: UIViewController {
    private let button = BoxButton(text: "테스트버튼입니다", style: .secondary, size: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
