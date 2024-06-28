//
//  BoxButton.swift
//  AppCore_DesignSystem
//
//  Created by max on 6/16/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

public final class BoxButton: BaseButton {
    private var text: String?
    private var leftIcon: Icon.Attributes?
    private var rightIcon: Icon.Attributes?
    private let attributes: BoxButton.Attributes
    
    public init(
        text: String?,
        leftIcon: Icon.Attributes? = nil,
        rightIcon: Icon.Attributes? = nil,
        attributes: BoxButton.Attributes
    ) {
        self.text = text
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.attributes = attributes
        
        super.init()

        configure()
    }

    public convenience init(
        text: String?,
        icon: Icon.Attributes? = nil,
        attributes: BoxButton.Attributes
    ) {
        self.init(
            text: text,
            leftIcon: icon,
            rightIcon: icon,
            attributes: attributes
        )
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setText(_ text: String?) {
        self.text = text
        configure()
    }
}

// MARK: - Configure

extension BoxButton {
    private func configure() {
        configureAttributedText()
        configureContentInsets()
        configureBackgroundColor()
        configureBorder()
        configureLeftIcon()
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
        setHorizontalSpacing(size.horizontalSpacing)
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

    private func configureLeftIcon() {
        guard let leftIcon else { return }

        setImage(
            normal: .icon(attributes: leftIcon),
            highlighted: .icon(attributes: leftIcon),
            disabled: .icon(icon: leftIcon.icon, size: leftIcon.size, color: .gray100),
            selected: .icon(attributes: leftIcon)
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

extension BoxButton {
    private var size: BoxButton.Size {
        return attributes.size
    }

    private var style: BoxButton.Style {
        return attributes.style
    }
}
