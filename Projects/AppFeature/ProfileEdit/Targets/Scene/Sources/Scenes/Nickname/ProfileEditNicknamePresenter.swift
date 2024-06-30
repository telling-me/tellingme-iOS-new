//
//  ProfileEditNicknamePresenter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import SharedKit

protocol ProfileEditNicknamePresentationLogic {
    func presentNickname(_ nickname: String?)
    func presentNicknameValidity(errorType: ProfileEditNickname.NicknameErrorType?)
}

final class ProfileEditNicknamePresenter {
    private weak var viewController: (any ProfileEditNicknameDisplayLogic)?

    init(viewController: (any ProfileEditNicknameDisplayLogic)) {
        self.viewController = viewController
    }
}

// MARK: - Presentation Logic

extension ProfileEditNicknamePresenter: ProfileEditNicknamePresentationLogic {
    func presentNickname(_ nickname: String?) {
        viewController?.displayNickname(nickname)
    }

    func presentNicknameValidity(errorType: ProfileEditNickname.NicknameErrorType?) {
        if let errorType {
            viewController?.displayNicknameValidity(.invalid(errorType.errorText))
        } else {
            viewController?.displayNicknameValidity(.valid)
        }
    }
}

extension ProfileEditNickname.NicknameErrorType {
    var errorText: String {
        switch self {
        case .invalidKorean:
            return "한글만 입력가능합니다."
        case .invalidTextCount:
            return "2-8자 이내로 입력해주세요."
        case .duplicatedError:
            return "중복된 닉네임입니다. 다시 입력해주세요."
        case .explicitError:
            return "부적절한 닉네임입니다. 새로 입력해주세요."
        }
    }
}
