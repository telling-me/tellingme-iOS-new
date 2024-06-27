//
//  Font+UITextView.swift
//  AppCore_Entity
//
//  Created by 마경미 on 25.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

extension UITextView {
    public func setText(
        text: String?,
        style: Font.Style,
        textColor: UIColor? = nil,
        textAlignment: NSTextAlignment = .natural
    ) {
        self.attributedText = Font.build(
            string: text,
            attributes: .init(
                style: style,
                textColor: textColor,
                textAlignment: textAlignment
            )
        )
    }
}
