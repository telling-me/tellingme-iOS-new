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
public protocol ___VARIABLE_sceneName___Scene: AnyObject, Scene {
    
}

public struct ___VARIABLE_sceneName___Configuration {
    
    public init() {}
    
}

public final class ___VARIABLE_sceneName___ScenBuilder {
    
    public init() {}
    
    public func make(with configuration: ___VARIABLE_sceneName___Configuration) -> ___VARIABLE_sceneName___Scene {
        let viewController = ___VARIABLE_sceneName___ViewController()
        let worker = ___VARIABLE_sceneName___Worker()
        let presenter = ___VARIABLE_sceneName___Presenter(
            viewController: viewController
        )
        let interactor = ___VARIABLE_sceneName___Interactor(
            presenter: presenter,
            worker: worker
        )
        let router = ___VARIABLE_sceneName___Router(
            viewController: viewController,
            dataStore: interactor
        )
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}