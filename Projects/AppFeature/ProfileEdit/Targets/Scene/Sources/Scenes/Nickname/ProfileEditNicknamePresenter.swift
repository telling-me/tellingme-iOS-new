//
//  ProfileEditNicknamePresenter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import SharedKit

protocol ProfileEditNicknamePresentationLogic {}

final class ProfileEditNicknamePresenter {
    private weak var viewController: (any ProfileEditNicknameDisplayLogic)?

    init(viewController: (any ProfileEditNicknameDisplayLogic)) {
        self.viewController = viewController
    }
}

// MARK: - Presentation Logic

extension ProfileEditNicknamePresenter: ProfileEditNicknamePresentationLogic {
    
}
