//
//  ProfileEditNicknameModels.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import AppCore_Entity

enum ProfileEditNickname {
    enum NicknameErrorType {
        case invalidKorean
        case invalidTextCount
        case duplicatedError
        case explicitError
    }

    enum Const {
        static let nicknameMinCount = 2
        static let nicknameMaxCount = 8
    }
}
