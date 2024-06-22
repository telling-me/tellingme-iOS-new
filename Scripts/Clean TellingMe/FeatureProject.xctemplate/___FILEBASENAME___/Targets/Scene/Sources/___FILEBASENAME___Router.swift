//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
protocol ___VARIABLE_sceneName___RoutingLogic {}

final class ___VARIABLE_sceneName___Router {
    private weak var viewController: ___VARIABLE_sceneName___ViewController?
    private let dataStore: any ___VARIABLE_sceneName___DataStore

    init(
        viewController: ___VARIABLE_sceneName___ViewController?,
        dataStore: any ___VARIABLE_sceneName___DataStore
    ) { 
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___RoutingLogic {
    
}
