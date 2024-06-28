//
//  ProfileEditBirthGenderPresenter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import SharedKit

protocol ProfileEditBirthGenderPresentationLogic {
    func presentBirthGender(birth: Int?, gender: EditingProfile.Gender?)
    func presentBirthValidity(errorType: ProfileEditBirthGender.BirthErrorType?)
    func presentButton(isEnabled: Bool)
}

final class ProfileEditBirthGenderPresenter {
    private weak var viewController: (any ProfileEditBirthGenderDisplayLogic)?

    init(viewController: (any ProfileEditBirthGenderDisplayLogic)) {
        self.viewController = viewController
    }
}

// MARK: - Presentation Logic

extension ProfileEditBirthGenderPresenter: ProfileEditBirthGenderPresentationLogic {
    func presentBirthGender(birth: Int?, gender: EditingProfile.Gender?) {
        viewController?.displayBirthGender(birth: birth.map { "\($0)" }, gender: gender)

        let isNextButtonEnabled = birth != nil && gender != nil
        viewController?.displayNextButton(isEnabled: isNextButtonEnabled)
    }

    func presentBirthValidity(errorType: ProfileEditBirthGender.BirthErrorType?) {
        if let errorType {
            viewController?.displayBirthValidity(.invalid(errorType.errorText))
        } else {
            viewController?.displayBirthValidity(.valid)
        }
    }

    func presentButton(isEnabled: Bool) {
        viewController?.displayNextButton(isEnabled: isEnabled)
    }
}

extension ProfileEditBirthGender.BirthErrorType {
    var errorText: String {
        switch self {
        case .invalidForm:
            return "올바른 형식으로 다시 입력해주세요."
        }
    }
}
