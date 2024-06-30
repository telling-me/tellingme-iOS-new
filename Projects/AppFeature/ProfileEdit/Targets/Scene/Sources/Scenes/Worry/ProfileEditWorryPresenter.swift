//
//  ProfileEditWorryPresenter.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import SharedKit

protocol ProfileEditWorryPresentationLogic {
    func presentSelectedWorry(_ worryList: [EditingProfile.Worry])
    func showError()
}

final class ProfileEditWorryPresenter {
    private weak var viewController: (any ProfileEditWorryDisplayLogic)?

    init(viewController: (any ProfileEditWorryDisplayLogic)) {
        self.viewController = viewController
    }
}

// MARK: - Presentation Logic

extension ProfileEditWorryPresenter: ProfileEditWorryPresentationLogic {
    func presentSelectedWorry(_ worryList: [EditingProfile.Worry]) {
        var selectedIndices: [Int] = []
        let worryListViewModel = ProfileEditWorry.Worry.allCases
        
        for worry in worryList {
            if let index = worryListViewModel.firstIndex(where: { $0 == worry.toViewModel }) {
                selectedIndices.append(index)
            }
        }

        viewController?.displayWorryList(selectedIndices: selectedIndices)
    }

    func showError() {
        viewController?.displayToast()
    }
}

private extension EditingProfile.Worry {
    var toViewModel: ProfileEditWorry.Worry {
        switch self {
        case .학업진로:
            return .학업진로
        case .대인관계:
            return .대인관계
        case .성격가치관:
            return .성격가치관
        case .행동습관:
            return .행동습관
        case .건강:
            return .건강
        case .기타:
            return .기타
        }
    }
}
