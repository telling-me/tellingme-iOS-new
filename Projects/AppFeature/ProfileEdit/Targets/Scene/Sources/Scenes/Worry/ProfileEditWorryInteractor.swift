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

protocol ProfileEditWorryBusinessLogic {}

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
    
    // MARK: - DataStore
}

// MARK: Feature ()

extension ProfileEditWorryInteractor {
    
}
