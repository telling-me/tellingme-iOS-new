//
//  ProfileEditJobRouter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
protocol ProfileEditJobRoutingLogic {}

final class ProfileEditJobRouter {
    private weak var viewController: ProfileEditJobViewController?
    private let dataStore: any ProfileEditJobDataStore

    init(
        viewController: ProfileEditJobViewController?,
        dataStore: any ProfileEditJobDataStore
    ) { 
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension ProfileEditJobRouter: ProfileEditJobRoutingLogic {
    
}
