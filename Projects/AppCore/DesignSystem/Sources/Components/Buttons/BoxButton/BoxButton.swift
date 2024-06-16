//
//  BoxButton.swift
//  AppCore_DesignSystem
//
//  Created by max on 6/16/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

public final class BoxButton: BaseButton {
    private let attributes: BoxButton.Attributes
    
    private var size: BoxButton.Size {
        return attributes.size
    }
    
    private var style: BoxButton.Style {
        return attributes.style
    }
    
    public init(attributes: BoxButton.Attributes) {
        self.attributes = attributes
        super.init()
        
        configure()
    }
    
    public convenience init(
        text: String?,
        style: BoxButton.Style,
        size: BoxButton._Size
    ) {
        self.init(
            attributes: .init(
                text: text,
                style: style,
                size: size
            )
        )
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

extension BoxButton {
    private func configure() {
        configureAttributedText()
        configureContentInsets()
        configureBackgroundColor()
        configureBorder()
    }
    
    private func configureAttributedText() {
        guard let text = attributes.text else { return }
        
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
}
