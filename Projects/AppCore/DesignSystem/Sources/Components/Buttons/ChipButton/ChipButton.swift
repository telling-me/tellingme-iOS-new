//
//  ChipButton.swift
//  AppCore_DesignSystem
//
//  Created by Woody Lee on 6/17/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

public final class ChipButton: BaseButton {
    private var text: String?
    private var rightIcon: Icon.Attributes?
    private let attributes: ChipButton.Attributes

    public init(
        text: String?,
        rightIcon: Icon.Attributes? = nil,
        attributes: ChipButton.Attributes
    ) {
        self.text = text
        self.rightIcon = rightIcon
        self.attributes = attributes

        super.init()

        configure()
    }

    public convenience init(
        text: String?,
        attributes: ChipButton.Attributes
    ) {
        self.init(
            text: text,
            rightIcon: nil,
            attributes: attributes
        )
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

extension ChipButton {
    private func configure() {
        configureAttributedText()
        configureContentInsets()
        configureBackgroundColor()
        configureBorder()
        configureRightIcon()
    }

    private func configureAttributedText() {
        guard let text else { return }

        let normal: Font.Attributes = .init(
            style: size.fontStyle,
            textColor: style.normalColorSet.textColor
        )
        let highlighted: Font.Attributes = .init(
            style: size.fontStyle,
            textColor: style.highlightedColorSet.textColor
        )
        let disabled: Font.Attributes = .init(
            style: size.fontStyle,
            textColor: style.disabledColorSet.textColor
        )
        let selected: Font.Attributes = .init(
            style: size.fontStyle,
            textColor: style.selectedColorSet.textColor
        )

        setAttributedText(text, attributes: normal, for: .normal)
        setAttributedText(text, attributes: highlighted, for: .highlighted)
        setAttributedText(text, attributes: disabled, for: .disabled)
        setAttributedText(text, attributes: selected, for: .selected)
    }

    private func configureContentInsets() {
        setVerticalSpacing(size.verticalSpacing)
        setRightSpacing(size.rightSpacing)
        setLeftSpacing(size.leftSpacing)
        setImageSpacing(size.imageSpacing)
    }

    private func configureBackgroundColor() {
        setBackgroundColor(
            normal: style.normalColorSet.backgroundColor,
            highlighted: style.highlightedColorSet.backgroundColor,
            disabled: style.disabledColorSet.backgroundColor,
            selected: style.selectedColorSet.backgroundColor
        )
    }

    private func configureBorder() {
        setBorderCornerRadius(size.cornerRadius)
        setBorderColor(
            normal: style.normalColorSet.borderColor,
            highlighted: style.highlightedColorSet.borderColor,
            disabled: style.disabledColorSet.borderColor,
            selected: style.selectedColorSet.borderColor
        )
    }

    private func configureRightIcon() {
        guard let rightIcon else { return }

        setRightImage(
            normal: .icon(attributes: rightIcon),
            highlighted: .icon(attributes: rightIcon),
            disabled: .icon(icon: rightIcon.icon, size: rightIcon.size, color: .gray100),
            selected: .icon(attributes: rightIcon)
        )
    }
}

// MARK: - Utils

extension ChipButton {
    private var size: ChipButton.Size {
        return attributes.size
    }

    private var style: ChipButton.Style {
        return attributes.style
    }
}
