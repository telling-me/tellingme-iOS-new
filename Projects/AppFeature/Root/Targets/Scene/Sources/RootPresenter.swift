//
//  RootPresenter.swift
//  
//
//  Created by Woody Lee on 6/6/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Foundation

import SharedKit

protocol RootPresentationLogic {}

final class RootPresenter {
    weak var viewController: RootDisplayLogic?
    
}

// MARK: - Presentation Logic

extension RootPresenter: RootPresentationLogic {
    
}
