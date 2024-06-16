//
//  BoxButton+Attributes.swift
//  AppCore_DesignSystem
//
//  Created by max on 6/16/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Foundation

// MARK: - Attributes

extension BoxButton {
    public struct Attributes {
        public var text: String?
        public let style: BoxButton.Style
        public let size: BoxButton.Size

        public init(
            text: String? = nil,
            style: BoxButton.Style,
            size: BoxButton._Size
        ) {
            self.text = text
            self.style = style
            self.size = size.convertToSize(style: style)
        }
    }
}

// MARK: - Size

extension BoxButton {
    public enum _Size {
        case large
        case medium
        case small
    }

    public struct Size: Hashable {
        let height: CGFloat // Note: height는 사용되지 않으나 높이가 제대로 측정되지 않을 경우 속성을 적용합니다.
        let fontStyle: Font.Style
        let cornerRadius: CGFloat
        let verticalSpacing: CGFloat
        let horizontalSpacing: CGFloat
    }
}

extension BoxButton.Size {
    public static let large: Self = .init(
        height: 50,
        fontStyle: .body_01_B,
        cornerRadius: 12,
        verticalSpacing: 13,
        horizontalSpacing: 32
    )
    
    public static let medium: Self = .init(
        height: 40,
        fontStyle: .body_02_B,
        cornerRadius: 12,
        verticalSpacing: 9.5,
        horizontalSpacing: 16
    )
    
    public static let small: Self = .init(
        height: 30,
        fontStyle: .caption_01_B,
        cornerRadius: 8,
        verticalSpacing: 6,
        horizontalSpacing: 8
    )
    
    public static let singleLarge: Self = .init(
        height: 38,
        fontStyle: .body_01_B,
        cornerRadius: 12,
        verticalSpacing: 7,
        horizontalSpacing: 10
    )
    
    public static let singleMedium: Self = .init(
        height: 36,
        fontStyle: .body_02_B,
        cornerRadius: 12,
        verticalSpacing: 7.5,
        horizontalSpacing: 10
    )
    
    public static let singleSmall: Self = .init(
        height: 30,
        fontStyle: .caption_01_B,
        cornerRadius: 8,
        verticalSpacing: 6,
        horizontalSpacing: 10
    )
}

// MARK: Converting (_Size -> Size)

extension BoxButton._Size {
    private var toSingleSize: BoxButton.Size {
        switch self {
        case .large:
            return .singleLarge
        case .medium:
            return .singleMedium
        case .small:
            return .singleSmall
        }
    }

    private var toSize: BoxButton.Size {
        switch self {
        case .large:
            return .large
        case .medium:
            return .medium
        case .small:
            return .small
        }
    }

    func convertToSize(style: BoxButton.Style) -> BoxButton.Size {
        if style == .single, style == .singleBlack {
            return self.toSingleSize
        } else {
            return self.toSize
        }
    }
}

// MARK: - Style

extension BaseButton {
    public struct Style: Hashable {
        let normalColorSet: ButtonColorSet
        let highlightedColorSet: ButtonColorSet
        let disabledColorSet: ButtonColorSet
        let selectedColorSet: ButtonColorSet
    }
}

extension BaseButton.Style {
    public static let primary: Self = .init(
        normalColorSet: .primaryNormal,
        highlightedColorSet: .primaryHighlighted,
        disabledColorSet: .disabledColorSet,
        selectedColorSet: .primaryNormal
    )
    
    public static let primaryLight: Self = .init(
        normalColorSet: .primaryLightNormal,
        highlightedColorSet: .primaryLightHighlighted,
        disabledColorSet: .disabledColorSet,
        selectedColorSet: .primaryLightNormal
    )
    
    public static let secondary: Self = .init(
        normalColorSet: .secondaryNormal,
        highlightedColorSet: .secondaryHighlighted,
        disabledColorSet: .disabledColorSet,
        selectedColorSet: .secondaryNormal
    )
    
    public static let single: Self = .init(
        normalColorSet: .singleNormal,
        highlightedColorSet: .singleHighlighted,
        disabledColorSet: .singleDisabledColorSet,
        selectedColorSet: .singleSelected
    )
    
    public static let singleBlack: Self = .init(
        normalColorSet: .singleBlackNormal,
        highlightedColorSet: .singleBlackHighlighted,
        disabledColorSet: .singleDisabledColorSet,
        selectedColorSet: .singleBlackSelected
    )
}
