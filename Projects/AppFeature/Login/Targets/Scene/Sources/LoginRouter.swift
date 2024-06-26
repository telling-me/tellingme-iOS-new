//
//  LoginRouter.swift
//  
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
protocol LoginRoutingLogic {}

final class LoginRouter {
    private weak var viewController: LoginViewController?
    private let dataStore: any LoginDataStore

    init(
        viewController: LoginViewController?,
        dataStore: any LoginDataStore
    ) { 
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension LoginRouter: LoginRoutingLogic {
    
}
