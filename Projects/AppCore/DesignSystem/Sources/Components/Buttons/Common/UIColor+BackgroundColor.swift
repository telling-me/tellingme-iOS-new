//
//  UIColor+BackgroundColor.swift
//  AppCore_DesignSystem
//
//  Created by max on 6/16/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

extension UIButton {
    func setBackgroundColor(_ color: UIColor?, for state: UIControl.State) {
        guard let color else { return }
       
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        setBackgroundImage(backgroundImage, for: state)
    }
}
