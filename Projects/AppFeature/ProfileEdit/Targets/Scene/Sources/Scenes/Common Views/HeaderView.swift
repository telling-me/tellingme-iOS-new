//
//  HeaderView.swift
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

final class HeaderView: UIView {
    let stackView = UIStackView()
    let captionLabel = UILabel()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Set up

extension HeaderView {
    private func setupUI() {
        stackView.do {
            $0.axis = .vertical
            $0.spacing = Const.captionTitleSpacing
            $0.alignment = .fill
            $0.distribution = .fill
            $0.setCustomSpacing(Const.titleDescriptionSpacing, after: titleLabel)

            $0.addArrangedSubview(captionLabel)
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(descriptionLabel)

            addSubview($0)
            $0.snp.makeConstraints { make in
                make.directionalEdges.equalToSuperview()
            }
        }
    }
}

// MARK: - Configure

extension HeaderView {
    enum Content {
        case nickname
        case birthGender
        case job
        case worry
    }

    func configure(content: Content) {
        captionLabel.setText(
            text: content.caption,
            style: .caption_01_B,
            textColor: .primary400
        )

        titleLabel.setText(
            text: content.title,
            style: .head_02_B,
            textColor: .gray600
        )
        
        descriptionLabel.setText(
            text: content.description,
            style: .body_02_R,
            textColor: .gray600
        )

        captionLabel.numberOfLines = 0
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0

        captionLabel.isHidden = content.caption == nil
        descriptionLabel.isHidden = content.description == nil
    }
}

// MARK: - Const

extension HeaderView {
    private enum Const {
        static let captionTitleSpacing = 2.0
        static let titleDescriptionSpacing = 4.0
    }
}

extension HeaderView.Content {
    var title: String {
        switch self {
        case .nickname:
            return "닉네임을 입력해주세요"
        case .birthGender:
            return "출생연도와 성별을 알려주세요"
        case .job:
            return "직업을 선택해주세요"
        case .worry:
            return "고민을 선택해주세요"
        }
    }

    var description: String? {
        switch self {
        case .nickname:
            return "닉네임은 이후에도 변경 가능해요"
        case .birthGender:
            return nil
        case .job:
            return "나와 비슷한 텔러들의 이야기를 먼저 확인할 수 있어요\n(마이페이지에서 변경 가능)"
        case .worry:
            return "나와 비슷한 텔러들의 이야기를 먼저 확인할 수 있어요\n(마이페이지에서 변경 가능)"
        }
    }

    var caption: String? {
        switch self {
        case .nickname:
            return nil
        case .birthGender:
            return nil
        case .job:
            return nil
        case .worry:
            return "최대 2가지 선택 가능"
        }
    }
}
