//
//  ChipButton+Attributes.swift
//  AppCore_DesignSystem
//
//  Created by Woody Lee on 6/17/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Foundation

extension ChipButton {
    public struct Attributes {
        let style: ChipButton.Style
        let size: ChipButton.Size
    }
}

extension ChipButton.Attributes {
    public static let borderedMedium: Self = .init(
        style: .bordered,
        size: .medium
    )

    public static let borderedSmall: Self = .init(
        style: .bordered,
        size: .small
    )

    public static let filledMedium: Self = .init(
        style: .filled,
        size: .medium
    )

    public static let filledSmall: Self = .init(
        style: .filled,
        size: .small
    )
}

// MARK: - Size

extension ChipButton {
    struct Size {
        let height: CGFloat
        let fontStyle: Font.Style
        let cornerRadius: CGFloat
        let leftSpacing: CGFloat
        let rightSpacing: CGFloat
        let verticalSpacing: CGFloat
        var imageSpacing: CGFloat = .zero
    }
}

extension ChipButton.Size {
    static let mediumIcon: Self = .init(
        height: 36,
        fontStyle: .body_02_B,
        cornerRadius: 18,
        leftSpacing: 16,
        rightSpacing: 12,
        verticalSpacing: 8,
        imageSpacing: 2
    )

    static let smallIcon: Self = .init(
        height: 32,
        fontStyle: .caption_01_B,
        cornerRadius: 16,
        leftSpacing: 10,
        rightSpacing: 6,
        verticalSpacing: 6,
        imageSpacing: 2
    )

    static let medium: Self = .init(
        height: 36,
        fontStyle: .body_02_B,
        cornerRadius: 18,
        leftSpacing: 16,
        rightSpacing: 12,
        verticalSpacing: 8
    )

    static let small: Self = .init(
        height: 32,
        fontStyle: .caption_01_B,
        cornerRadius: 16,
        leftSpacing: 10,
        rightSpacing: 10,
        verticalSpacing: 7
    )
}

// MARK: - Style

extension ChipButton {
    struct Style {
        let normalColorSet: ButtonColorSet
        let highlightedColorSet: ButtonColorSet
        let disabledColorSet: ButtonColorSet
        let selectedColorSet: ButtonColorSet
    }
}

extension ChipButton.Style {
    static let bordered: Self = .init(
        normalColorSet: .chipNormal,
        highlightedColorSet: .chipHighlighted,
        disabledColorSet: .chipDisabled,
        selectedColorSet: .chipNormal
    )
    static let filled: Self = .init(
        normalColorSet: .chipFilledNormal,
        highlightedColorSet: .chipFilledHighlighted,
        disabledColorSet: .chipFilledDisabled,
        selectedColorSet: .chipFilledNormal
    )
}
