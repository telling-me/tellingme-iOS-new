//
//  ProfileEditNicknameInteractor.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Combine
import Foundation

import AppCore_Entity
import SharedKit

protocol ProfileEditNicknameBusinessLogic {
    func loadIfNeeded()
    func verifyNickname(_ nickname: String)
}

protocol ProfileEditNicknameDataStore: AnyObject {}

final class ProfileEditNicknameInteractor
: ProfileEditNicknameBusinessLogic,
  ProfileEditNicknameDataStore {
    private let presenter: ProfileEditNicknamePresentationLogic
    private let worker: ProfileEditNicknameWorkerProtocol
    private let externalDataStore: ProfileEditDataStore

    init(
        presenter: any ProfileEditNicknamePresentationLogic,
        worker: any ProfileEditNicknameWorkerProtocol,
        externalDataStore: ProfileEditDataStore
    ) {
        self.presenter = presenter
        self.worker = worker
        self.externalDataStore = externalDataStore
    }
}

// MARK: Feature

extension ProfileEditNicknameInteractor {
    func loadIfNeeded() {
        let profile = externalDataStore.editingProfile?.profileInfo
        presenter.presentNickname(profile?.nickname)
    }

    func verifyNickname(_ nickname: String) {
        var errorType: ProfileEditNickname.NicknameErrorType?

        // 글자수 제한
        let textCount = nickname.count
        let textCountRange = (ProfileEditNickname.Const.nicknameMinCount...ProfileEditNickname.Const.nicknameMaxCount)
        if textCountRange.contains(textCount) == false,
           textCount != 0 {
            errorType = .invalidTextCount
        }
        presentNicknameErrorIfNeeded(errorType)

        // 한국어 이외 문자 제한
        let koreanRegex = "^[가-힣ㄱ-ㅎㅏ-ㅣ]*$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", koreanRegex)
        if predicate.evaluate(with: nickname) == false {
            errorType = .invalidKorean
        }
        presentNicknameErrorIfNeeded(errorType)

        if errorType == nil {
            externalDataStore.editingProfile?.profileInfo.nickname = nickname
        }
    }

    private func presentNicknameErrorIfNeeded(_ errorType: ProfileEditNickname.NicknameErrorType?) {
        presenter.presentNicknameValidity(errorType: errorType)
    }
}
