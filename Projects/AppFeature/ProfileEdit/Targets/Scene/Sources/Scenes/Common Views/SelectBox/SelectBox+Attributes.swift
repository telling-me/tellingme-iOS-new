//
//  SelectBox+Attributes.swift
//  ProfileEditScene
//
//  Created by Woody Lee on 6/25/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

import AppCore_DesignSystem

extension SelectBox {
    public struct Attributes {
        private(set) var text: String
        private(set) var icon: Icon.Attributes?
        private(set) var inputPlaceholder: String?
        private(set) var isSelected: Bool
        private(set) var isDisabled: Bool

        public init(
            text: String,
            icon: Icon.Attributes? = nil,
            inputPlaceholder: String? = nil,
            isSelected: Bool = false,
            isDisabled: Bool = false
        ) {
            self.text = text
            self.icon = icon
            self.inputPlaceholder = inputPlaceholder
            self.isSelected = isSelected
            self.isDisabled = isDisabled
        }
    }
}

extension SelectBox.Attributes {
    func withIsSelected(_ isSelected: Bool) -> Self {
        var attributes = self
        attributes.isSelected = isSelected
        return attributes
    }

    func withIsDisables(_ isDisabled: Bool) -> Self {
        var attributes = self
        attributes.isDisabled = isDisabled
        return attributes
    }
}
