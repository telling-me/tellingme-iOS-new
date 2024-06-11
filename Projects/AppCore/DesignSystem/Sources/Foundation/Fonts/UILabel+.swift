//
//  UILabel+.swift
//  AppCore_DesignSystem
//
//  Created by 마경미 on 11.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

extension UILabel {
    public func setText(text: String?, style: Font.Style) {
        if let text = text {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.maximumLineHeight = style.lineHeight
            paragraphStyle.minimumLineHeight = style.lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: paragraphStyle
            ]
                
            let attrString = NSAttributedString(string: text,
                                                attributes: attributes)
            self.attributedText = attrString
        }
        
        self.font = .fontNanum(style)
    }
}
