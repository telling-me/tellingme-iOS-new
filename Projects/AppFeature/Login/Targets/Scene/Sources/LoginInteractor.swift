//
//  LoginInteractor.swift
//  
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Combine
import Foundation

import AppCore_Entity
import SharedKit

protocol LoginBusinessLogic {}

protocol LoginDataStore: AnyObject {}

final class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    private let presenter: LoginPresentationLogic
    private let worker: LoginWorkerProtocol
    
    init(
        presenter: any LoginPresentationLogic,
        worker: any LoginWorkerProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: - DataStore
}

// MARK: Feature ()

extension LoginInteractor {
    
}
