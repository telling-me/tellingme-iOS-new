//
//  ProfileEditNicknameInteractor.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Combine
import Foundation

import AppCore_Entity
import SharedKit

protocol ProfileEditNicknameBusinessLogic {}

protocol ProfileEditNicknameDataStore: AnyObject {}

final class ProfileEditNicknameInteractor: ProfileEditNicknameBusinessLogic, ProfileEditNicknameDataStore {
    private let presenter: ProfileEditNicknamePresentationLogic
    private let worker: ProfileEditNicknameWorkerProtocol
    private let externalDataStore: ProfileEditDataStore

    init(
        presenter: any ProfileEditNicknamePresentationLogic,
        worker: any ProfileEditNicknameWorkerProtocol,
        externalDataStore: ProfileEditDataStore
    ) {
        self.presenter = presenter
        self.worker = worker
        self.externalDataStore = externalDataStore
    }
    
    // MARK: - DataStore
}

// MARK: Feature ()

extension ProfileEditNicknameInteractor {
    
}
