//
//  ProfileEditJobPresenter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import SharedKit

protocol ProfileEditJobPresentationLogic {}

final class ProfileEditJobPresenter {
    private weak var viewController: (any ProfileEditJobDisplayLogic)?

    init(viewController: (any ProfileEditJobDisplayLogic)) {
        self.viewController = viewController
    }
}

// MARK: - Presentation Logic

extension ProfileEditJobPresenter: ProfileEditJobPresentationLogic {
    
}
