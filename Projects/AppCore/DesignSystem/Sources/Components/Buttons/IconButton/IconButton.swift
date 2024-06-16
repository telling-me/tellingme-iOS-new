//
//  IconButton.swift
//  AppCore_DesignSystem
//
//  Created by Woody Lee on 6/17/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

public final class IconButton: BaseButton {
    private let attributes: IconButton.Attributes

    public init(attributes: IconButton.Attributes) {
        self.attributes = attributes
        super.init()

        configure()
    }

    public convenience init(
        icon: Icon,
        iconColor: UIColor?,
        size: IconButton.Size
    ) {
        self.init(
            attributes: .init(
                icon: icon,
                iconColor: iconColor,
                size: size
            )
        )
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

extension IconButton {
    private func configure() {
        configureIcons()
        configureContentInsets()
    }

    private func configureIcons() {
        setImage(
            normal: .icon(
                attributes: .init(
                    icon: attributes.icon,
                    size: attributes.size.iconSize,
                    color: attributes.iconColor
                )
            ),
            highlighted: .icon(
                attributes: .init(
                    icon: attributes.icon,
                    size: attributes.size.iconSize,
                    color: attributes.iconColor
                )
            ),
            disabled: .icon(
                icon: attributes.icon,
                size: attributes.size.iconSize,
                color: .gray100
            )
            ,
            selected: .icon(
                attributes: .init(
                    icon: attributes.icon,
                    size: attributes.size.iconSize,
                    color: attributes.iconColor
                )
            )
        )
    }

    private func configureContentInsets() {
        setEdgeSpacing(attributes.size.contentInsets)
    }
}

extension IconButton {
    public struct Attributes {
        let icon: Icon
        let iconColor: UIColor?
        let size: IconButton.Size

        public init(
            icon: Icon,
            iconColor: UIColor?,
            size: IconButton.Size
        ) {
            self.icon = icon
            self.iconColor = iconColor
            self.size = size
        }
    }
}

extension IconButton {
    public struct Size {
        let iconSize: Icon.Size
        let contentInsets: CGFloat
    }
}

extension IconButton.Size {
    public static let large: Self = .init(
        iconSize: .p32,
        contentInsets: 8
    )

    public static let medium: Self = .init(
        iconSize: .p24,
        contentInsets: 12
    )

    public static let small: Self = .init(
        iconSize: .p20,
        contentInsets: 14
    )
}
