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
    
    init(
        presenter: any ProfileEditWorryPresentationLogic,
        worker: any ProfileEditWorryWorkerProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: - DataStore
}

// MARK: Feature ()

extension ProfileEditWorryInteractor {
    
}
