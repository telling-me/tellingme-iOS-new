//
//  UIFont+Name.swift
//  AppCore_DesignSystem
//
//  Created by 마경미 on 11.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

extension UIFont {
    public static func fontNanum(_ fontStyle: Font.Style) -> UIFont {
        guard let font = UIFont(font: fontStyle.font, size: fontStyle.size.rawValue) else {
            return UIFont()
        }
        return font
    }
}
