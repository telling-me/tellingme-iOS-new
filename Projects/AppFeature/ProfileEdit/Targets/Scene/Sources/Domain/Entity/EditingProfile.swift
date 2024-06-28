//
//  EditingProfile.swift
//  ProfileEditScene
//
//  Created by Woody Lee on 6/22/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Foundation

public struct EditingProfile {
    public var socialType: SocialType
    public var profileInfo: ProfileInfo
}

extension EditingProfile {
    public enum SocialType {
        case kakao
        case apple
    }
}

extension EditingProfile {
    public struct ProfileInfo {
        public var birth: Int?
        public var gender: Gender?
        public var job: Job?
        public var worryList: [Worry] = []
    }

    public enum Gender {
        case male
        case female
    }

    public enum Job {
        case 중고등학생
        case 대학생 // Note: 대학원생 포함 - 재용
        case 취업준비생
        case 직장인
        case 주부
        case 기타(String)
    }

    public enum Worry {
        case 학업진로
        case 대인관계
        case 성격가치관
        case 행동습관
        case 건강
        case 기타
    }
}
