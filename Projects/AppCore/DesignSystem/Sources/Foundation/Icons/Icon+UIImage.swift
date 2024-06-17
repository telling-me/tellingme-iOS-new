//
//  Icon+UIImage.swift
//  AppCore_DesignSystem
//
//  Created by Woody Lee on 6/10/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

extension UIImage {
    public static func icon(attributes: Icon.Attributes) -> UIImage {
        let assetName = attributes.assetName

        guard var image = UIImage(named: assetName, in: .module, with: nil)
        else { fatalError("❌ \(assetName) not exist") }

        if let color = attributes.color {
            image = image.withTintColor(color)
        }

        image = image.withRenderingMode(attributes.renderingMode)

        return image
    }

    public static func icon(
        icon: Icon,
        size: Icon.Size,
        color: UIColor?,
        renderingMode: UIImage.RenderingMode = .alwaysOriginal
    ) -> UIImage {
        self.icon(
            attributes: .init(
                icon: icon,
                size: size,
                color: color,
                renderingMode: renderingMode
            )
        )
    }
}
