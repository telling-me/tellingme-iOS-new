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
    
    init(
        presenter: any ProfileEditNicknamePresentationLogic,
        worker: any ProfileEditNicknameWorkerProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: - DataStore
}

// MARK: Feature ()

extension ProfileEditNicknameInteractor {
    
}
