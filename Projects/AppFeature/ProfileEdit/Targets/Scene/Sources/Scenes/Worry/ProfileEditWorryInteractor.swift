//
//  ProfileEditWorryInteractor.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Combine
import Foundation

import AppCore_Entity
import SharedKit

protocol ProfileEditWorryBusinessLogic {
    func loadIfNeeded()
    func storeWorry(selectedWorry: ProfileEditWorry.Worry)
}

protocol ProfileEditWorryDataStore: AnyObject {}

final class ProfileEditWorryInteractor: ProfileEditWorryBusinessLogic, ProfileEditWorryDataStore {
    private let presenter: ProfileEditWorryPresentationLogic
    private let worker: ProfileEditWorryWorkerProtocol
    private let externalDataStore: ProfileEditDataStore

    init(
        presenter: any ProfileEditWorryPresentationLogic,
        worker: any ProfileEditWorryWorkerProtocol,
        externalDataStore: ProfileEditDataStore
    ) {
        self.presenter = presenter
        self.worker = worker
        self.externalDataStore = externalDataStore
    }
}

// MARK: Feature

extension ProfileEditWorryInteractor {
    func loadIfNeeded() {
        let worryList = externalDataStore.editingProfile?.profileInfo.worryList ?? []
        presenter.presentSelectedWorry(worryList)
    }

    func storeWorry(selectedWorry: ProfileEditWorry.Worry) {
        guard var worryList = externalDataStore.editingProfile?.profileInfo.worryList
        else { return }

        let worry: EditingProfile.Worry

        switch selectedWorry {
        case .학업진로:
            worry = .학업진로
        case .대인관계:
            worry = .대인관계
        case .성격가치관:
            worry = .성격가치관
        case .행동습관:
            worry = .행동습관
        case .건강:
            worry = .건강
        case .기타:
            worry = .기타
        }

        print("### hello")

        if let firstIndex = worryList.firstIndex(of: worry) {
            // 제거
            worryList.remove(at: firstIndex)
            externalDataStore.editingProfile?.profileInfo.worryList = worryList

            presenter.presentSelectedWorry(worryList)
        } else if worryList.count >= 2 {
            // 오류처리
            presenter.showError()
            return
        } else {
            // 저장
            worryList.append(worry)
            externalDataStore.editingProfile?.profileInfo.worryList = worryList

            presenter.presentSelectedWorry(worryList)
        }
    }
}
