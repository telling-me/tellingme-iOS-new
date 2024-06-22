//
//  ProfileEditJobInteractor.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Combine
import Foundation

import AppCore_Entity
import SharedKit

protocol ProfileEditJobBusinessLogic {}

protocol ProfileEditJobDataStore: AnyObject {}

final class ProfileEditJobInteractor: ProfileEditJobBusinessLogic, ProfileEditJobDataStore {
    private let presenter: ProfileEditJobPresentationLogic
    private let worker: ProfileEditJobWorkerProtocol
    private let externalDataStore: ProfileEditDataStore

    init(
        presenter: any ProfileEditJobPresentationLogic,
        worker: any ProfileEditJobWorkerProtocol,
        externalDataStore: ProfileEditDataStore
    ) {
        self.presenter = presenter
        self.worker = worker
        self.externalDataStore = externalDataStore
    }
    
    // MARK: - DataStore
}

// MARK: Feature ()

extension ProfileEditJobInteractor {
    
}
