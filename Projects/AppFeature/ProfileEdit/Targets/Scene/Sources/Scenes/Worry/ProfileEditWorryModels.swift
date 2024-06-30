//
//  ProfileEditWorryModels.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import AppCore_Entity

enum ProfileEditWorry {
    enum Worry: String, CaseIterable {
        case 학업진로
        case 대인관계
        case 성격가치관
        case 행동습관
        case 건강
        case 기타
    }
}
