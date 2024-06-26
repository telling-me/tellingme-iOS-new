//
//  ProfileEditWorryPresenter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import SharedKit

protocol ProfileEditWorryPresentationLogic {}

final class ProfileEditWorryPresenter {
    private weak var viewController: (any ProfileEditWorryDisplayLogic)?

    init(viewController: (any ProfileEditWorryDisplayLogic)) {
        self.viewController = viewController
    }
}

// MARK: - Presentation Logic

extension ProfileEditWorryPresenter: ProfileEditWorryPresentationLogic {
    
}
