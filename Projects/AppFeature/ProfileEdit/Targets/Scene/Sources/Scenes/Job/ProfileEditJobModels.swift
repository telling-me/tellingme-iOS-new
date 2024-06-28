//
//  ProfileEditJobModels.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import AppCore_Entity

enum ProfileEditJob {
    // MARK: - Entity

    // MARK: - ViewModel

    enum Job: String, CaseIterable {
        case 중고등학생
        case 대학생
        case 취업준비생
        case 직장인
        case 주부
        case 기타
    }
}
