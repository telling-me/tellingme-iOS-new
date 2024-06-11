//
//  UILabel+.swift
//  AppCore_DesignSystem
//
//  Created by 마경미 on 11.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

extension UILabel {
    public func setTextWithStyle(text: String?, fontStyle: Font.Style) {
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = fontStyle.lineHeight
            style.minimumLineHeight = fontStyle.lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style
            ]
                
            let attrString = NSAttributedString(string: text,
                                                attributes: attributes)
            self.attributedText = attrString
        }
        
        self.font = .fontNanum(fontStyle)
    }
}
