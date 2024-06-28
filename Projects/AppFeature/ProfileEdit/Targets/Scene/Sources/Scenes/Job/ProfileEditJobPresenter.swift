//
//  ProfileEditJobPresenter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import SharedKit

protocol ProfileEditJobPresentationLogic {
    func presentJob(job: EditingProfile.Job?)
}

final class ProfileEditJobPresenter {
    private weak var viewController: (any ProfileEditJobDisplayLogic)?

    init(viewController: (any ProfileEditJobDisplayLogic)) {
        self.viewController = viewController
    }
}

// MARK: - Presentation Logic

extension ProfileEditJobPresenter: ProfileEditJobPresentationLogic {
    func presentJob(job: EditingProfile.Job?) {
        guard let job else { return }

        let index = ProfileEditJob.Job.allCases
            .firstIndex(of: job.toViewModel)

        var etc: String? = nil
        var isNextButtonEnabled: Bool = true
        if case let .기타(string) = job {
            etc = string
            isNextButtonEnabled = string.isEmpty == false
        }

        viewController?.displayJob(
            selectedIndex: index,
            etc: etc,
            isNextButtonEnabled: isNextButtonEnabled
        )
    }
}

private extension EditingProfile.Job {
    var toViewModel: ProfileEditJob.Job {
        switch self {
        case .중고등학생:
            return .중고등학생
        case .대학생:
            return .대학생
        case .취업준비생:
            return .중고등학생
        case .직장인:
            return .직장인
        case .주부:
            return .주부
        case .기타:
            return .기타
        }
    }
}
