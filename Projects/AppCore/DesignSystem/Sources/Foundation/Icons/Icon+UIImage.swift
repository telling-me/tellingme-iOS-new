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

        image = image.withRenderingMode(attributes.renderingMode)

        return image
    }

    public static func icon(
        icon: Icon,
        size: Icon.Size,
        renderingMode: UIImage.RenderingMode = .alwaysOriginal
    ) -> UIImage {
        let attributes = Icon.Attributes(icon: icon, size: size, renderingMode: renderingMode)
        let assetName = attributes.assetName

        guard var image = UIImage(named: assetName, in: .module, with: nil)
        else { fatalError("❌ \(assetName) not exist") }

        image = image.withRenderingMode(renderingMode)

        return image
    }
}
