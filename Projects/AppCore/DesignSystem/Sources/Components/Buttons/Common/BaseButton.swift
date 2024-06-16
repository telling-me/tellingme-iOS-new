//
//  BaseButton.swift
//  AppCore_DesignSystem
//
//  Created by max on 6/16/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Combine
import UIKit

public class BaseButton: UIButton {
    private var cancellables: Set<AnyCancellable> = .init()
  
    private var topInset: CGFloat = 0
    private var leftInset: CGFloat = 0
    private var rightInset: CGFloat = 0
    private var bottomInset: CGFloat = 0
    private var imageSpacing: CGFloat = 0
    
    private var borderStateContainer: [UInt: UIColor?] = [:]
    
    private var needsToUpdateContentInsets: Bool = true
    
    public init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        updateContentInsets()
    }
}

extension BaseButton {
    private func setup() {
        layer.masksToBounds = true
        
        publisher(for: \.isHighlighted)
            .sink { [weak self] in self?.didHighlightedStateChanged($0) }
            .store(in: &cancellables)
        
        publisher(for: \.isSelected)
            .sink { [weak self] _ in self?.didChangeState() }
            .store(in: &cancellables)
        
        publisher(for: \.isEnabled)
            .sink { [weak self] _ in self?.didChangeState() }
            .store(in: &cancellables)
    }
}

// MARK: - State (Private)

extension BaseButton {
    private func didHighlightedStateChanged(_ isHighlighted: Bool) {
        animatingScaleDown(direction: isHighlighted)
        didChangeState()
    }

    private func didChangeState() {
        updateBorder()
    }
}

// MARK: - Tap Handler

extension BaseButton {
    public func setTapHandler(_ handler: @escaping () -> Void) {
        self.addAction(
            .init(handler: { _ in handler() }),
            for: .touchUpInside
        )
    }
}

// MARK: - BackgroundColor (Interface)

extension BaseButton {
    public func setBackgroundColor(
        normal: UIColor?,
        highlighted: UIColor?,
        disabled: UIColor? = nil,
        selected: UIColor? = nil
    ) {
        setBackgroundColor(normal, for: .normal)
        setBackgroundColor(highlighted ?? normal, for: .highlighted)
        setBackgroundColor(disabled, for: .disabled)
        setBackgroundColor(selected, for: .selected)
    }
}

// MARK: - Border

extension BaseButton {
    public func setBorderCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    public func setBorderColor(
        normal: UIColor?,
        highlighted: UIColor?,
        disabled: UIColor? = nil,
        selected: UIColor? = nil
    ) {
        let highlighted = highlighted ?? normal
        
        borderStateContainer[UIButton.State.normal.rawValue] = normal
        borderStateContainer[UIButton.State.highlighted.rawValue] = highlighted
        borderStateContainer[UIButton.State.disabled.rawValue] = disabled
        borderStateContainer[UIButton.State.selected.rawValue] = selected
        
        updateBorder()
    }
    
    private func updateBorder() {
        guard let borderColor = borderStateContainer[state.rawValue],
              let cgColor = borderColor?.cgColor
        else { return }
        
        layer.borderColor = cgColor
        layer.borderWidth = 1.0
    }
}

// MARK: - Font

extension BaseButton {
    public func setAttributedText(
        _ text: String,
        attributes: Font.Attributes,
        for state: UIButton.State
    ) {
        setAttributedTitle(
            text.attributedFont(attributes: attributes),
            for: state
        )
    }
    
    public func setAttributedText(
        _ text: String,
        style: Font.Style,
        textColor: UIColor?,
        for state: UIButton.State
    ) {
        setAttributedTitle(
            text.attributedFont(attributes: .init(
                style: style,
                textColor: textColor
            )),
            for: state
        )
    }
}

// MARK: - Content Insets

extension BaseButton {
    public func setNeedsToUpdateContentInsets() {
        needsToUpdateContentInsets = true
        setNeedsLayout()
    }
    
    public func setImageSpacing(_ spacing: CGFloat) {
        self.imageSpacing = spacing
        setNeedsToUpdateContentInsets()
    }
    
    public func setVerticalSpacing(_ spacing: CGFloat) {
        self.topInset = spacing
        self.bottomInset = spacing
        setNeedsToUpdateContentInsets()
    }
    
    public func setHorizontalSpacing(_ spacing: CGFloat) {
        self.leftInset = spacing
        self.rightInset = spacing
        setNeedsToUpdateContentInsets()
    }
    
    private func updateContentInsets() {
        guard needsToUpdateContentInsets else { return }
        
        needsToUpdateContentInsets = false
        
        let hasLeftImage = imageView?.isHidden == false
        let hasTitle = titleLabel?.isHidden == false
        
        let leftImageSpacing = hasLeftImage && hasTitle
        ? self.imageSpacing
        : 0.0
        
        let leftSpacingInset = leftImageSpacing / 2
        
        imageEdgeInsets = .init(
            top: 0,
            left: -leftSpacingInset,
            bottom: 0,
            right: leftSpacingInset
        )
        
        titleEdgeInsets = .init(
            top: 0,
            left: leftSpacingInset,
            bottom: 0,
            right: -leftSpacingInset
        )
        
        contentEdgeInsets = .init(
            top: topInset,
            left: leftInset + leftSpacingInset,
            bottom: bottomInset,
            right: rightInset + leftSpacingInset
        )
    }
}

// MARK: - Animation

extension BaseButton {
    private var duration: Double { 0.3 }

    private func animatingScaleDown(direction: Bool) {
        let highlightedScale: Double = 0.96
        let transform = direction ?
        CGAffineTransform(scaleX: highlightedScale, y: highlightedScale)
        : .identity

        UIViewPropertyAnimator(
            duration: duration,
            curve: .easeInOut,
            animations: { self.transform = transform }
        )
        .startAnimation()
    }
}
