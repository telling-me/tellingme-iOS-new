//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ tellingUs. All rights reserved.
//

import Foundation

import SharedKit

protocol ___VARIABLE_sceneName___PresentationLogic {}

final class ___VARIABLE_sceneName___Presenter {
    private weak var viewController: (any ___VARIABLE_sceneName___DisplayLogic)?

    init(viewController: (any ___VARIABLE_sceneName___DisplayLogic)) {
        self.viewController = viewController
    }
}

// MARK: - Presentation Logic

extension ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___PresentationLogic {
    
}
