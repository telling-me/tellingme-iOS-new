//
//  SelectBox.swift
//  ProfileEditScene
//
//  Created by Woody Lee on 6/24/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Combine
import SnapKit
import Then
import UIKit

import AppCore_DesignSystem
import SharedKit

public final class SelectBox: UIView {
    private let verticalStackView = UIStackView()
    private let horizontalStackView = UIStackView()
    private let checkImageView = UIImageView()
    private let textLabel = UILabel()

    private var iconImageView: UIImageView? = nil
    private var inputField: InputField? = nil

    private var attributes: Attributes {
        didSet {
            configure()
        }
    }

    public init(attributes: Attributes) {
        self.attributes = attributes
        super.init(frame: .zero)
        setupUI()
    }

    public convenience init(
        text: String,
        icon: Icon.Attributes? = nil,
        inputPlaceholder: String? = nil,
        isSelected: Bool = false,
        isDisabled: Bool = false
    ) {
        self.init(
            attributes: .init(
                text: text,
                icon: icon,
                inputPlaceholder: inputPlaceholder,
                isSelected: isSelected,
                isDisabled: isDisabled
            )
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Set up

extension SelectBox {
    private func setupUI() {
        self.do {
            $0.layer.cornerRadius = Const.radius
            $0.layer.masksToBounds = true
            $0.layer.borderWidth = Const.borderWidth
            $0.layer.borderColor = mainColor.cgColor
        }

        verticalStackView.do {
            $0.axis = .vertical
            $0.spacing = Const.verticalSpacing
            $0.alignment = .fill
            $0.distribution = .fill

            addSubview($0)
            $0.snp.makeConstraints { make in
                make.directionalHorizontalEdges.equalToSuperview().inset(14)
                make.directionalVerticalEdges.equalToSuperview().inset(16)
            }
        }

        horizontalStackView.do {
            $0.axis = .horizontal
            $0.spacing = Const.checkRightSpacing
            $0.alignment = .center
            $0.distribution = .fill

            verticalStackView.addArrangedSubview($0)
        }

        checkImageView.do {
            $0.image = .icon(icon: .check, size: .p24, color: mainColor)
            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)

            horizontalStackView.addArrangedSubview($0)
        }

        textLabel.do {
            $0.setText(
                text: attributes.text,
                style: .body_01_R,
                textColor: Const.textColor
            )

            horizontalStackView.addArrangedSubview($0)
        }

        layoutIconImageViewIfNeeded()
    }

    private func layoutIconImageViewIfNeeded() {
        guard let icon = attributes.icon,
              iconImageView == nil
        else { return }

        let iconImageView = UIImageView()
        iconImageView.image = .icon(attributes: icon)

        horizontalStackView.insertArrangedSubview(iconImageView, at: 1)
        horizontalStackView.setCustomSpacing(Const.imageRightSpacing, after: iconImageView)

        self.iconImageView = iconImageView
    }

    private func layoutInputFieldIfNeeded() {
        guard let inputPlaceholder = attributes.inputPlaceholder,
              inputField == nil
        else { return }

        let inputField = InputField()
        inputField.updatePlaceholder(inputPlaceholder)

        verticalStackView.addArrangedSubview(inputField)

        self.inputField = inputField
    }

    private var mainColor: UIColor {
        if attributes.isDisabled {
            return Const.disabledColor
        } else if attributes.isSelected {
            return Const.selectedColor
        } else {
            return Const.normalColor
        }
    }
}

// MARK: - Configure

extension SelectBox {
    private func configure() {
        checkImageView.image = .icon(icon: .check, size: .p24, color: mainColor)
        self.layer.borderColor = mainColor.cgColor
    }
}
// MARK: - Interface

extension SelectBox {
    func updateIsSelected(_ isSelected: Bool) {
        self.attributes = attributes.withIsSelected(isSelected)
    }
}

// MARK: - Const

extension SelectBox {
    private enum Const {
        static let verticalSpacing = 16.0
        static let checkRightSpacing = 12.0
        static let imageRightSpacing = 8.0
        static let borderWidth = 1.0
        static let radius = 12.0

        static let normalColor: UIColor = .gray200
        static let selectedColor: UIColor = .primary400
        static let disabledColor: UIColor = .gray200
        static let textColor: UIColor = .gray600
    }
}
