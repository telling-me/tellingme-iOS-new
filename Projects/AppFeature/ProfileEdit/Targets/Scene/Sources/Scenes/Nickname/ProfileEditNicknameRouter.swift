//
//  ProfileEditNicknameRouter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
protocol ProfileEditNicknameRoutingLogic {}

final class ProfileEditNicknameRouter {
    private weak var viewController: ProfileEditNicknameViewController?
    private let dataStore: any ProfileEditNicknameDataStore

    init(
        viewController: ProfileEditNicknameViewController?,
        dataStore: any ProfileEditNicknameDataStore
    ) { 
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension ProfileEditNicknameRouter: ProfileEditNicknameRoutingLogic {
    
}
