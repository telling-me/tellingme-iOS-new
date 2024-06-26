//
//  ProfileEditWorryRouter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
protocol ProfileEditWorryRoutingLogic {}

final class ProfileEditWorryRouter {
    private weak var viewController: ProfileEditWorryViewController?
    private let dataStore: any ProfileEditWorryDataStore

    init(
        viewController: ProfileEditWorryViewController?,
        dataStore: any ProfileEditWorryDataStore
    ) { 
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension ProfileEditWorryRouter: ProfileEditWorryRoutingLogic {
    
}
