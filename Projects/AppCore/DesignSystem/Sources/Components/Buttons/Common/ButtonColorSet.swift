//
//  ButtonColorSet.swift
//  AppCore_DesignSystem
//
//  Created by max on 6/16/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

struct ButtonColorSet: Hashable {
    let textColor: UIColor
    let backgroundColor: UIColor?
    let borderColor: UIColor?
}

extension ButtonColorSet {
    static let primaryNormal: Self = .init(
        textColor: .base00,
        backgroundColor: .primary400,
        borderColor: nil
    )
    
    static let primaryHighlighted: Self = .init(
        textColor: .base00,
        backgroundColor: .primary500,
        borderColor: nil
    )
    
    static let primaryLightNormal: Self = .init(
        textColor: .primary400,
        backgroundColor: .gray50,
        borderColor: nil
    )
    
    static let primaryLightHighlighted: Self = .init(
        textColor: .primary500,
        backgroundColor: .gray50,
        borderColor: nil
    )
    
    static let secondaryNormal: Self = .init(
        textColor: .primary400,
        backgroundColor: .primary50,
        borderColor: nil
    )
    
    static let secondaryHighlighted: Self = .init(
        textColor: .primary500,
        backgroundColor: .primary50,
        borderColor: nil
    )
    
    static let disabledColorSet: Self = .init(
        textColor: .gray300,
        backgroundColor: .gray50,
        borderColor: nil
    )
    
    static let singleNormal: Self = .init(
        textColor: .primary400,
        backgroundColor: .clear,
        borderColor: nil
    )
    
    static let singleHighlighted: Self = .init(
        textColor: .primary500,
        backgroundColor: .gray50,
        borderColor: nil
    )
    
    static let singleSelected: Self = .init(
        textColor: .primary400,
        backgroundColor: .gray100,
        borderColor: nil
    )
    
    static let singleBlackNormal: Self = .init(
        textColor: .gray600,
        backgroundColor: .clear,
        borderColor: nil
    )
    
    static let singleBlackHighlighted: Self = .init(
        textColor: .gray700,
        backgroundColor: .gray50,
        borderColor: nil
    )
    
    static let singleBlackSelected: Self = .init(
        textColor: .gray600,
        backgroundColor: .gray100,
        borderColor: nil
    )
    
    static let singleDisabledColorSet: Self = .init(
        textColor: .gray300,
        backgroundColor: .clear,
        borderColor: nil
    )

    static let chipNormal: Self = .init(
        textColor: .gray600,
        backgroundColor: .clear,
        borderColor: .gray400
    )

    static let chipHighlighted: Self = .init(
        textColor: .gray600,
        backgroundColor: .clear,
        borderColor: .gray600
    )

    static let chipDisabled: Self = .init(
        textColor: .gray300,
        backgroundColor: .clear,
        borderColor: .gray200
    )

    static let chipFilledNormal: Self = .init(
        textColor: .gray600,
        backgroundColor: .background200,
        borderColor: nil
    )

    static let chipFilledHighlighted: Self = .init(
        textColor: .gray600,
        backgroundColor: .background200,
        borderColor: nil
    )

    static let chipFilledDisabled: Self = .init(
        textColor: .gray300,
        backgroundColor: .background200,
        borderColor: nil
    )
}
