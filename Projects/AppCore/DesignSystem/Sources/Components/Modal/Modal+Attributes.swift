//
//  Modal+Attributes.swift
//  AppCore_DesignSystem
//
//  Created by Woody Lee on 6/17/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Foundation

extension Modal {
    public struct Attributes {
        let title: String
        let description: String?
        let primaryActionText: String
        let primaryActionHandler: () -> Void
        let secondaryActionText: String?
        let secondaryActionHandler: (() -> Void)?

        public init(
            title: String,
            description: String? = nil,
            primaryActionText: String,
            primaryActionHandler: @escaping () -> Void,
            secondaryActionText: String? = nil,
            secondaryActionHandler: (() -> Void)? = nil
        ) {
            self.title = title
            self.description = description
            self.primaryActionText = primaryActionText
            self.primaryActionHandler = primaryActionHandler
            self.secondaryActionText = secondaryActionText
            self.secondaryActionHandler = secondaryActionHandler
        }
    }
}
