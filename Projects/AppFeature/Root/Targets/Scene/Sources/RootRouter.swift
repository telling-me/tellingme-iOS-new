//
//  RootRouter.swift
//  
//
//  Created by Woody Lee on 6/6/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import UIKit

import SharedKit

@MainActor
protocol RootRoutingLogic {}

final class RootRouter {
    weak var viewController: RootViewController?
    weak var dataStore: RootDataStore?
}

extension RootRouter: RootRoutingLogic {
    
}
