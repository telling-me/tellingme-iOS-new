//
//  File.swift
//  AppCore_DesignSystem
//
//  Created by Woody Lee on 6/17/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

extension UIViewPropertyAnimator {
    public func withCompletion(_ completion: @escaping ((UIViewAnimatingPosition) -> Void)) -> Self {
        addCompletion(completion)
        return self
    }
}
