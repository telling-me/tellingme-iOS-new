//
//  ProfileEditBirthGenderRouter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
protocol ProfileEditBirthGenderRoutingLogic {}

final class ProfileEditBirthGenderRouter {
    private weak var viewController: ProfileEditBirthGenderViewController?
    private let dataStore: any ProfileEditBirthGenderDataStore

    init(
        viewController: ProfileEditBirthGenderViewController?,
        dataStore: any ProfileEditBirthGenderDataStore
    ) { 
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension ProfileEditBirthGenderRouter: ProfileEditBirthGenderRoutingLogic {
    
}
