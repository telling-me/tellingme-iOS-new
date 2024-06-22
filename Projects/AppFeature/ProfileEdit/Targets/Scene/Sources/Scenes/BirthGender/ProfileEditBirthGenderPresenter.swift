//
//  ProfileEditBirthGenderPresenter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import SharedKit

protocol ProfileEditBirthGenderPresentationLogic {}

final class ProfileEditBirthGenderPresenter {
    private weak var viewController: (any ProfileEditBirthGenderDisplayLogic)?

    init(viewController: (any ProfileEditBirthGenderDisplayLogic)) {
        self.viewController = viewController
    }
}

// MARK: - Presentation Logic

extension ProfileEditBirthGenderPresenter: ProfileEditBirthGenderPresentationLogic {
    
}
