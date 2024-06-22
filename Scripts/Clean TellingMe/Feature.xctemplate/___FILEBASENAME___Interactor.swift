//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ tellingUs. All rights reserved.
//

import Combine
import Foundation

import AppCore_Entity
import SharedKit

protocol ___VARIABLE_sceneName___BusinessLogic {}

protocol ___VARIABLE_sceneName___DataStore: AnyObject {}

final class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic, ___VARIABLE_sceneName___DataStore {
    private let presenter: ___VARIABLE_sceneName___PresentationLogic
    private let worker: ___VARIABLE_sceneName___WorkerProtocol
    
    init(
        presenter: any ___VARIABLE_sceneName___PresentationLogic,
        worker: any ___VARIABLE_sceneName___WorkerProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: - DataStore
}

// MARK: Feature ()

extension ___VARIABLE_sceneName___Interactor {
    
}
