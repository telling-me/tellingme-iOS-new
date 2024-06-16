//
//  Font+UILabel.swift
//  AppCore_DesignSystem
//
//  Created by 마경미 on 11.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

extension UILabel {
    public func setText(
        text: String?,
        style: Font.Style,
        textColor: UIColor? = nil
    ) {
        self.attributedText = Font.build(
            string: text,
            attributes: .init(
                style: style,
                textColor: textColor
            )
        )
    }
}
