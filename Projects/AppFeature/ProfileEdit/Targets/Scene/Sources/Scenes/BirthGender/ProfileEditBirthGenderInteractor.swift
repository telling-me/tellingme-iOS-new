//
//  ProfileEditBirthGenderInteractor.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Combine
import Foundation

import AppCore_Entity
import SharedKit

protocol ProfileEditBirthGenderBusinessLogic {
    func loadIfNeeded()
    func verifyBirth(_ birth: String)
    func selectGender(_ gender: EditingProfile.Gender)
}

protocol ProfileEditBirthGenderDataStore: AnyObject {}

final class ProfileEditBirthGenderInteractor: ProfileEditBirthGenderBusinessLogic, ProfileEditBirthGenderDataStore {
    private let presenter: ProfileEditBirthGenderPresentationLogic
    private let worker: ProfileEditBirthGenderWorkerProtocol
    private let externalDataStore: ProfileEditDataStore

    init(
        presenter: any ProfileEditBirthGenderPresentationLogic,
        worker: any ProfileEditBirthGenderWorkerProtocol,
        externalDataStore: ProfileEditDataStore
    ) {
        self.presenter = presenter
        self.worker = worker
        self.externalDataStore = externalDataStore
    }
    
    // MARK: - DataStore
}

// MARK: Feature

extension ProfileEditBirthGenderInteractor {
    func loadIfNeeded() {
        let profile = externalDataStore.editingProfile?.profileInfo
        presenter.presentBirthGender(birth: profile?.birth, gender: profile?.gender)
    }

    func verifyBirth(_ birth: String) {
        var errorType: ProfileEditBirthGender.BirthErrorType?
        let year = Calendar.current.component(.year, from: Date())

        if birth.hasPrefix("0") {
            errorType = .invalidForm
        }

        guard let birth = Int(birth) else {
            presenter.presentBirthValidity(errorType: errorType)
            return
        }

        if birth > year {
            errorType = .invalidForm
        }

        if errorType == nil {
            externalDataStore.editingProfile?.profileInfo.birth = birth
        } else {
            externalDataStore.editingProfile?.profileInfo.birth = nil
        }

        presenter.presentBirthValidity(errorType: errorType)
        presenter.presentButton(isEnabled: canGoNext)
    }

    func selectGender(_ gender: EditingProfile.Gender) {
        externalDataStore.editingProfile?.profileInfo.gender = gender

        presenter.presentButton(isEnabled: canGoNext)
    }

    private var canGoNext: Bool {
        let profile = externalDataStore.editingProfile?.profileInfo
        
        return profile?.birth != nil && profile?.gender != nil
    }
}
