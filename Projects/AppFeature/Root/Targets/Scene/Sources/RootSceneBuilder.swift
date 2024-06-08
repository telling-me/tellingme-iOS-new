//
//  RootSceneBuilder.swift
//  
//
//  Created by Woody Lee on 6/6/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
public protocol RootScene: AnyObject, Scene {
    
}

public struct RootConfiguration {
    
    public init() {}

}

public final class RootScenBuilder {
    
    public init() {}
    
    public func make(with configuration: RootConfiguration) -> RootScene {
        
        let presenter = RootPresenter()
        let router = RootRouter()
        let worker = RootWorker()
        let interactor = RootInteractor(
            presenter: presenter,
            worker: worker
        )
        let viewController = RootViewController(
            interactor: interactor,
            router: router
        )
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
