//
//  InputField+CustomTextField.swift
//  ProfileEditScene
//
//  Created by Woody Lee on 6/23/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

final class TextField: UITextField {
    let caretHeight = 20.0
    let caretOffsetY = 2.0

    override func caretRect(for position: UITextPosition) -> CGRect {
        var rect = super.caretRect(for: position)
        let diffY = rect.size.height - caretHeight - caretOffsetY
        rect.origin.y += diffY
        rect.size.height = caretHeight
        return rect
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.placeholderRect(forBounds: bounds)
        let diffY = rect.size.height - caretHeight
        rect.origin.y += diffY
        rect.size.height = caretHeight
        return rect
    }
}
