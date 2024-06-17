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
        public let style: BoxButton.Style
        public let size: BoxButton.Size

        public init(
            style: BoxButton.Style,
            size: BoxButton.Size
        ) {
            self.style = style
            self.size = size
        }
    }
}

extension BoxButton.Attributes {
    public static let primaryLarge: Self = .init(
        style: .primary,
        size: .large
    )
 
    public static let primaryMedium: Self = .init(
        style: .primary,
        size: .medium
    )

    public static let primarySmall: Self = .init(
        style: .primary,
        size: .small
    )

    public static let primaryLightLarge: Self = .init(
        style: .primaryLight,
        size: .large
    )

    public static let primaryLightMedium: Self = .init(
        style: .primaryLight,
        size: .medium
    )

    public static let primaryLightSmall: Self = .init(
        style: .primaryLight,
        size: .small
    )

    public static let secondaryLarge: Self = .init(
        style: .secondary,
        size: .large
    )

    public static let secondaryMedium: Self = .init(
        style: .secondary,
        size: .medium
    )

    public static let secondarySmall: Self = .init(
        style: .secondary,
        size: .small
    )

    public static let singleLarge: Self = .init(
        style: .single,
        size: .singleLarge
    )

    public static let singleMedium: Self = .init(
        style: .single,
        size: .singleMedium
    )

    public static let singleSmall: Self = .init(
        style: .single,
        size: .singleSmall
    )

    public static let singleBlackLarge: Self = .init(
        style: .singleBlack,
        size: .singleLarge
    )

    public static let singleBlackMedium: Self = .init(
        style: .singleBlack,
        size: .singleMedium
    )

    public static let singleBlackSmall: Self = .init(
        style: .singleBlack,
        size: .singleSmall
    )

    public static let singleBlackIconLarge: Self = .init(
        style: .singleBlack,
        size: .singleIconLarge
    )

    public static let singleBlackIconMedium: Self = .init(
        style: .singleBlack,
        size: .singleIconMedium
    )

    public static let singleBlackIconSmall: Self = .init(
        style: .singleBlack,
        size: .singleIconSmall
    )
}

// MARK: - Size

extension BoxButton {
    public struct Size: Hashable {
        let height: CGFloat // Note: height는 사용되지 않으나 높이가 제대로 측정되지 않을 경우 속성을 적용합니다.
        let fontStyle: Font.Style
        let cornerRadius: CGFloat
        let verticalSpacing: CGFloat
        let horizontalSpacing: CGFloat
        var imageSpacing: CGFloat = 8 // Note: default는 8로 설정합니다.
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

    public static let singleIconLarge: Self = .init(
        height: 50,
        fontStyle: .body_01_B,
        cornerRadius: 12,
        verticalSpacing: 13,
        horizontalSpacing: 10,
        imageSpacing: 8
    )

    public static let singleIconMedium: Self = .init(
        height: 36,
        fontStyle: .body_02_B,
        cornerRadius: 12,
        verticalSpacing: 6,
        horizontalSpacing: 10,
        imageSpacing: 8
    )

    public static let singleIconSmall: Self = .init(
        height: 30,
        fontStyle: .caption_01_B,
        cornerRadius: 8,
        verticalSpacing: 5,
        horizontalSpacing: 10,
        imageSpacing: 8
    )
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
