//
//  LoginPresenter.swift
//  
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import SharedKit

protocol LoginPresentationLogic {}

final class LoginPresenter {
    private weak var viewController: (any LoginDisplayLogic)?

    init(viewController: (any LoginDisplayLogic)) {
        self.viewController = viewController
    }
}

// MARK: - Presentation Logic

extension LoginPresenter: LoginPresentationLogic {
    
}
