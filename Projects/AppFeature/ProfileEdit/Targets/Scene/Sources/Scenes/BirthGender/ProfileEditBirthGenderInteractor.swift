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

protocol ProfileEditBirthGenderBusinessLogic {}

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

// MARK: Feature ()

extension ProfileEditBirthGenderInteractor {
    
}
