//
//  RootInteractor.swift
//  
//
//  Created by Woody Lee on 6/6/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Combine
import Foundation

import AppCore_Entity
import SharedKit

protocol RootBusinessLogic {}

protocol RootDataStore: AnyObject {}

final class RootInteractor: RootBusinessLogic, RootDataStore {
    var presenter: RootPresentationLogic?
    var worker: RootWorkerProtocol?
    
    init(
        presenter: any RootPresentationLogic,
        worker: any RootWorkerProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: - DataStore
}

// MARK: Feature ()

extension RootInteractor {
    
}
