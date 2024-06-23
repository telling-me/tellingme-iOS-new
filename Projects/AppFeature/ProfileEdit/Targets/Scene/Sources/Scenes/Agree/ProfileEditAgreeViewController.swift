//
//  ProfileEditAgreeViewController.swift
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

final class ProfileEditAgreeViewController: UIViewController {
    typealias Handler = () -> Void

    private let completionHandler: Handler
    
    init(completionHandler: @escaping Handler) {
        self.completionHandler = completionHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

extension ProfileEditAgreeViewController {
    private func setupUI() {
        view.backgroundColor = .white

        BoxButton(text: "다음", attributes: .primaryLarge)
            .do {
                view.addSubview($0)
                $0.snp.makeConstraints { make in
                    make.center.equalToSuperview()
                }

                $0.setTapHandler { [weak self] in
                    guard let self else { return }

                    self.dismiss(animated: true, completion: self.completionHandler)
                }
            }
    }
}
