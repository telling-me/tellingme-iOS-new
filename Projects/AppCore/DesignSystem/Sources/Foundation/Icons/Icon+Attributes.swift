//
//  Icon+Attributes.swift
//  AppCore_DesignSystem
//
//  Created by Woody Lee on 6/10/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

extension Icon {
    public struct Attributes {
        public let icon: Icon
        public let size: Size
        public let color: UIColor?
        public let renderingMode: UIImage.RenderingMode

        public init(
            icon: Icon,
            size: Size,
            color: UIColor?,
            renderingMode: UIImage.RenderingMode = .alwaysOriginal
        ) {
            self.icon = icon
            self.size = size
            self.color = color
            self.renderingMode = renderingMode
        }
    }
}

extension Icon.Attributes {
    var assetName: String {
        return "\(icon.name)_\(size.rawValue)"
    }
}

extension Icon {
    public enum Size: Int {
        case p32 = 32
        case p24 = 24
        case p20 = 20
    }
}
