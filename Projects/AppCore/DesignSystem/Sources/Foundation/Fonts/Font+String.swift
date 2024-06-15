//
//  Font+String.swift
//  AppCore_DesignSystem
//
//  Created by max on 6/15/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Foundation

extension String {
    public func attributedFont(
        attributes: Font.Attributes
    ) -> NSMutableAttributedString {
        Font.build(string: self, attributes: attributes)
    }
}
